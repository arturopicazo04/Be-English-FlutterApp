import 'package:be_english/components/custom_multiple_choice.dart';
import 'package:be_english/data/exam_data.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:flutter/material.dart';

class ReadingPart5Page extends StatefulWidget {
  const ReadingPart5Page({Key? key}) : super(key: key);

  @override
  _ReadingPart5PageState createState() => _ReadingPart5PageState();
}

class _ReadingPart5PageState extends State<ReadingPart5Page> {
  List<String> userAnswers = List.filled(6, "");
  List<bool> isAnswerCorrect = List.filled(6, false);

  // Clean up the userAnswers
  @override
  void dispose() {
    userAnswers = List.filled(6, "");
    isAnswerCorrect = List.filled(6, false);
    super.dispose();
  }

  void checkAnswers() {
    for (int i = 0; i < ExamData.readingPartFiveAnswers.length; i++) {
      if (userAnswers[i] ==
          ExamData.readingPartFiveAnswers[i]['correctAnswer']) {
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
              for (int i = 0; i < ExamData.readingPartFiveAnswers.length; i++)
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
                    ExamData.readingPartFiveAnswers
                        .map((e) => e['correctAnswer'] as String)
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
        title: const Text("Reading Part 5"),
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
              ExamData.readingPartFiveQuestion,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              ExamData.readingPartFiveText,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < ExamData.readingPartFiveAnswers.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  CustomMultipleChoice(
                    question:
                        'Question ${i + 1}: ${ExamData.readingPartFiveAnswers[i]['question']}',
                    options: List<String>.from(
                        ExamData.readingPartFiveAnswers[i]['options']),
                    onSelected: (answer) {
                      setState(() {
                        userAnswers[i] = answer.split(' ')[0];
                      });
                    },
                  ),
                ],
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
}
