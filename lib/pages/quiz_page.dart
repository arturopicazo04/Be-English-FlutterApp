import 'package:be_english/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:be_english/components/custom_button.dart';
import 'package:be_english/service/firestore_service.dart';

class QuizPage extends StatefulWidget {
  final String collectionName;

  const QuizPage({Key? key, required this.collectionName}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0; // Puntuation of the quiz
  int _profileScore = 0; //Puntuation of Profile
  bool _isLoading = true;
  bool _showExample = false;
  bool? _isCorrect;
  FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(widget.collectionName)
          .get();

      List<Map<String, dynamic>> questions = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      questions.shuffle(); // Randomize the questions

      setState(() {
        _questions = questions.take(5).toList(); // Take 5 random questions
        for (var question in _questions) {
          if (question.containsKey('answers')) {
            question['answers'].shuffle(); // Randomize the answers
          }
        }
        _isLoading = false;
      });
    } catch (e) {
      // Errors
    }
  }

  void _answerQuestion(String selectedAnswer) async {
    String correctAnswer = _questions[_currentQuestionIndex]['verb'] ??
        _questions[_currentQuestionIndex]['word'];

    setState(() {
      _isCorrect = selectedAnswer == correctAnswer;
      if (_isCorrect!) {
        _score++;
        _profileScore += 4;
      } else {
        _profileScore--;
      }
      _showExample = false;
      _currentQuestionIndex++;

      if (_currentQuestionIndex >= _questions.length) {
        if (_score == 5) {
          _profileScore += 10;
        }
        _firestoreService.updateUserProfileScore(_profileScore);
        _showQuizResult();
      } else {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _isCorrect = null;
          });
        });
      }
    });
  }

  void _showQuizResult() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent user from dismissing the dialog by tapping outside
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('Your score is $_score/${_questions.length}\n'
            'You have ${_profileScore >= 0 ? 'gain +' : 'lost -'} ${_profileScore.abs()} points in your profile!'),
        actions: [
          CustomButton(
            text: 'OK',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_currentQuestionIndex >= _questions.length) {
      return const Scaffold(
        body: Center(child: Text('Quiz Completed')),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final answers = currentQuestion['answers'];
    final answersLength = answers != null ? answers.length : 0;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Ranking"),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion['definition'] ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (_isCorrect != null)
              Icon(
                _isCorrect! ? Icons.check : Icons.close,
                color: _isCorrect! ? Colors.green : Colors.red,
                size: 48,
              ),
            const SizedBox(height: 20),
            if (_showExample && widget.collectionName != 'vocabulary')
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  currentQuestion['example'] ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
            if (!_showExample && widget.collectionName != 'vocabulary') ...[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showExample = true;
                  });
                },
                child: const Text('Show Example'),
              ),
              const SizedBox(height: 20),
            ],
            ...List.generate(
              answersLength,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomButton(
                  text: answers![index],
                  onTap: () => _answerQuestion(answers[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
