import 'package:flutter/material.dart';
import 'package:be_english/components/custom_button.dart';
import 'package:be_english/data/exam_data.dart';

class OpenClozeExamPage extends StatefulWidget {
  const OpenClozeExamPage({Key? key}) : super(key: key);

  @override
  _OpenClozeExamPageState createState() => _OpenClozeExamPageState();
}

class _OpenClozeExamPageState extends State<OpenClozeExamPage> {
  List<String> userAnswers = List.filled(8, "");
  List<bool> isAnswerCorrect = List.filled(8, false);
  List<TextEditingController> controllers =
      List.generate(8, (_) => TextEditingController());

  void checkAnswers() {
    for (int i = 0; i < ExamData.correctAnswersOpenCloze.length; i++) {
      if (userAnswers[i].toUpperCase() == ExamData.correctAnswersOpenCloze[i]) {
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
              for (int i = 0; i < ExamData.correctAnswersOpenCloze.length; i++)
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Correct Answers"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0;
                              i < ExamData.correctAnswersOpenCloze.length;
                              i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Answer ${i + 1}: ${ExamData.correctAnswersOpenCloze[i]}',
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      actions: <Widget>[
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
        title: const Text("Open Cloze Exam"),
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
              ExamData.questionOpenCloze,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              ExamData.questionTextOpenCloze,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < ExamData.correctAnswersOpenCloze.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: controllers[i],
                  onChanged: (value) {
                    setState(() {
                      userAnswers[i] = value.toUpperCase();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Answer ${i + 1}",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isAnswerCorrect[i]
                            ? Colors.green
                            : Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isAnswerCorrect[i]
                            ? Colors.green
                            : Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            CustomButton(text: "Check Answers", onTap: checkAnswers),
          ],
        ),
      ),
    );
  }
}
