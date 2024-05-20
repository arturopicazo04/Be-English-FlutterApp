import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
        ),
        drawer: const CustomDrawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "Phrasal Verbs Quiz",
                  onTap: () {
                    Navigator.pushNamed(context, '/phrasal_verbs_quiz_page');
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Vocabulary Quiz",
                  onTap: () {
                    Navigator.pushNamed(context, '/vocabulary_quiz_page');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
