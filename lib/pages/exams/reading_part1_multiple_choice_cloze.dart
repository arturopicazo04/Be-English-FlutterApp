import 'package:be_english/components/custom_multiple_choice.dart';
import 'package:be_english/data/exam_data.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:flutter/material.dart';

class ReadingPart1Page extends StatefulWidget {
  const ReadingPart1Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReadingPart1PageState createState() => _ReadingPart1PageState();
}

class _ReadingPart1PageState extends State<ReadingPart1Page> {
  List<String> userAnswers = List.filled(8, "");
  List<bool> isAnswerCorrect = List.filled(8, false);

  void checkAnswers() {
    for (int i = 0; i < ExamData.readingPartOneAnswers.length; i++) {
      if (userAnswers[i] ==
          ExamData.readingPartOneAnswers[i]['correctAnswer']) {
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
              for (int i = 0; i < ExamData.readingPartOneAnswers.length; i++)
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
                    context,
                    ExamData.readingPartOneAnswers
                        .map((e) => e['correctAnswer'].toString())
                        .toList());
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
        title: const Text("Reading Part 1"),
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
              ExamData.readingPartOneQuestion,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              ExamData.readingPartOneText,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < ExamData.readingPartOneAnswers.length; i++)
              CustomMultipleChoice(
                question: ExamData.readingPartOneAnswers[i]['question'],
                options: List<String>.from(
                    ExamData.readingPartOneAnswers[i]['options']),
                onSelected: (answer) {
                  setState(() {
                    userAnswers[i] = answer.split(' ')[0];
                  });
                },
              ),
            ElevatedButton(
              onPressed: checkAnswers,
              child: const Text('Check Answers'),
            ),
          ],
        ),
      ),
    );
  }

  // Clean up the userAnswers
  @override
  void dispose() {
    userAnswers = List.filled(8, "");
    isAnswerCorrect = List.filled(8, false);
    super.dispose();
  }
}
