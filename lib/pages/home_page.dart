import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void startQuiz(BuildContext context, String collectionName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(collectionName: collectionName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Phrasal Verbs Quiz",
                onTap: () {
                  startQuiz(context, 'verbs');
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Vocabulary Quiz",
                onTap: () {
                  startQuiz(context, 'vocabulary');
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "C1 Exams Guide",
                onTap: () {
                  Navigator.pushNamed(context, '/guide_page');
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "C1 Interactive Exams",
                onTap: () {
                  Navigator.pushNamed(context, '/interactive_exams_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
