import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_drawer.dart';
import 'package:flutter/material.dart';

class InteractiveExamsPage extends StatelessWidget {
  const InteractiveExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Interactive Exams"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Use Of English",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    child: Column(
                      children: [
                        CustomButton(
                          text: "Open Cloze",
                          onTap: () {
                            Navigator.pushNamed(context, '/uoe_open_cloze');
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: "Word Formation",
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: "Key Word Transformation",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
