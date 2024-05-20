import 'package:flutter/material.dart';

class VocabularyQuizPage extends StatelessWidget {
  const VocabularyQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text("Vocabulary Quiz Page"),
      ),
    );
  }
}
