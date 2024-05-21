import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:be_english/components/custom_button.dart';

class QuizPage extends StatefulWidget {
  final String collectionName;

  const QuizPage({Key? key, required this.collectionName}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isLoading = true;
  bool _showExample = false;

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
        _isLoading = false;
      });
    } catch (e) {
      // Handle any errors here
    }
  }

  void _answerQuestion(String selectedAnswer) {
    if (_questions[_currentQuestionIndex]['verb'] == selectedAnswer ||
        _questions[_currentQuestionIndex]['word'] == selectedAnswer) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
      _showExample = false; // Reset example visibility for next question
    });

    if (_currentQuestionIndex >= _questions.length) {
      _showQuizResult();
    }
  }

  void _showQuizResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('Your score is $_score/${_questions.length}'),
        actions: [
          CustomButton(
            text: 'OK',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to home page
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
      appBar: AppBar(
        title: Text('Quiz (${_currentQuestionIndex + 1}/5)'),
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
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomButton(
                  text: answers[index],
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
