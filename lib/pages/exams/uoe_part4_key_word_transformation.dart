import 'package:be_english/components/custom_answer_field.dart';
import 'package:be_english/data/exam_data.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:flutter/material.dart';

class KeyWordTransformationExamPage extends StatefulWidget {
  const KeyWordTransformationExamPage({Key? key}) : super(key: key);

  @override
  _KeyWordTransformationExamPageState createState() =>
      _KeyWordTransformationExamPageState();
}

class _KeyWordTransformationExamPageState
    extends State<KeyWordTransformationExamPage> {
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  List<bool> isAnswerCorrect = List.filled(6, false);

  void checkAnswers() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Check Answers"),
          content: const Text(
            "Multiple choice questions cannot be automatically checked. Please check your answers manually.",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Show Correct Answers"),
              onPressed: () {
                Navigator.of(context).pop();
                showCorrectAnswersDialog(
                    context, ExamData.correctAnswersKeyWordTransformation);
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
        title: const Text("KeyWord Transformation Exercise"),
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
              ExamData.questionKeyWordTransformation,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              ExamData.questionTextKeyWordTransformation,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < 6; i++)
              CustomAnswerField(
                controller: controllers[i],
                index: i,
                isCorrect: isAnswerCorrect[i],
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
