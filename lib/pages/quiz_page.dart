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
//TODO: MOSTRAR SOLUCION

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _profileScore = 0;
  bool _isLoading = true;
  bool _showExample = false;
  bool? _isCorrect;
  String? _selectedAnswer;
  final FirestoreService _firestoreService = FirestoreService();

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
      List<Map<String, dynamic>> questions = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      questions.shuffle();
      setState(() {
        _questions = questions.take(5).toList();
        for (var question in _questions) {
          if (question.containsKey('answers')) {
            question['answers'].shuffle();
          }
        }
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
    }
  }

  void _answerQuestion(String selectedAnswer) {
    String correctAnswer = _questions[_currentQuestionIndex]['verb'] ??
        _questions[_currentQuestionIndex]['word'];
    setState(() {
      _selectedAnswer = selectedAnswer;
      _isCorrect = selectedAnswer == correctAnswer;
      if (_isCorrect!) {
        _score++;
        _profileScore += 4;
      } else {
        _profileScore--;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isCorrect = null;
        _selectedAnswer = null;
        _showExample = false;
        _currentQuestionIndex++;
        if (_currentQuestionIndex >= _questions.length) {
          if (_score == 5) {
            _profileScore += 10;
          }
          _firestoreService.calculateBonusPoints().then((bonusPoints) {
            _profileScore += bonusPoints;
            _firestoreService.updateUserProfileScore(_profileScore);
            _showQuizResult();
          });
        }
      });
    });
  }

  void _showQuizResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('Your score is $_score/${_questions.length}\n'
            'You have ${_profileScore >= 0 ? 'gained +' : 'lost -'}${_profileScore.abs()} points in your profile!'),
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

  Widget _buildSolution() {
    if (_isCorrect != null && !_isCorrect!) {
      final correctAnswer = _questions[_currentQuestionIndex]['verb'] ??
          _questions[_currentQuestionIndex]['word'];
      return Center(
        child: Text(
          'Correct answer: $correctAnswer',
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_currentQuestionIndex >= _questions.length) {
      return const Scaffold();
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final answers = currentQuestion['answers'];
    final answersLength = answers != null ? answers.length : 0;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Quiz"),
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
              (index) {
                final answer = answers![index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomButton(
                        text: answer,
                        onTap: _selectedAnswer == null
                            ? () => _answerQuestion(answer)
                            : () {},
                      ),
                    ),
                    if (_selectedAnswer == answer)
                      Positioned(
                        right: 10,
                        top: 0,
                        bottom: 0,
                        child: Icon(
                          _isCorrect! ? Icons.check : Icons.close,
                          color: _isCorrect!
                              ? Colors.green
                              : Color.fromARGB(244, 80, 10, 10),
                          size: 48,
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSolution(), // Mostrar la solución si la respuesta es incorrecta
          ],
        ),
      ),
    );
  }
}
