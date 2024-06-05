import 'package:be_english/components/custom_answer_field.dart';
import 'package:be_english/data/exam_data.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:flutter/material.dart';

class WordFormationExamPage extends StatefulWidget {
  const WordFormationExamPage({super.key});

  @override
  _WordFormationExamPageState createState() => _WordFormationExamPageState();
}

class _WordFormationExamPageState extends State<WordFormationExamPage> {
  List<String> userAnswers = List.filled(8, "");
  List<TextEditingController> controllers =
      List.generate(8, (_) => TextEditingController());
  List<bool> isAnswerCorrect = List.filled(8, false);

  void checkAnswers() {
    for (int i = 0; i < ExamData.correctAnswersWordFormation.length; i++) {
      if (userAnswers[i].toUpperCase() ==
          ExamData.correctAnswersWordFormation[i]) {
        isAnswerCorrect[i] = true;
      } else {
        isAnswerCorrect[i] = false;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Result"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 0;
                  i < ExamData.correctAnswersWordFormation.length;
                  i++)
                Row(
                  children: <Widget>[
                    Icon(
                      isAnswerCorrect[i] ? Icons.check : Icons.close,
                      color: isAnswerCorrect[i] ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Answer ${i + 1}: ${isAnswerCorrect[i] ? "Correct" : "Incorrect"}',
                        style: TextStyle(
                          color: isAnswerCorrect[i] ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Show Correct Answers"),
              onPressed: () {
                Navigator.of(context).pop();
                showCorrectAnswersDialog(
                    context, ExamData.correctAnswersWordFormation);
              },
            ),
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Use of English Part 3"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              ExamData.questionWordFormation,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              ExamData.questionTextWordFormation,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < 8; i++)
              CustomAnswerField(
                controller: controllers[i],
                index: i,
                isCorrect: isAnswerCorrect[i],
                onChanged: (value) {
                  setState(() {
                    userAnswers[i] = value.toUpperCase();
                  });
                },
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAnswers,
              child: const Text("Check Answers"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
