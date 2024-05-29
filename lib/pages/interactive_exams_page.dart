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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Reading and Use Of English",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      child: Column(
                        children: [
                          CustomButton(
                            text: "Part 1: Multiple Choice",
                            onTap: () {
                              Navigator.pushNamed(context,
                                  '/reading_part1_multiple_choice_cloze');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 2: Open Cloze",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/uoe_part2_open_cloze');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 3: Word Formation",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/uoe_part3_word_formation');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 4: Key Word Transformation",
                            onTap: () {
                              Navigator.pushNamed(context,
                                  '/uoe_part4_key_word_transformation');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 5: Multiple Choice",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/reading_part5_multiple_choice');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 6: Gapped Text",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/reading_part6_open_cloze');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 7: Multiple Matching",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/reading_part7_multiple_choice');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Listening",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      child: Column(
                        children: [
                          CustomButton(
                            text: "Part 1: Multiple Choice",
                            onTap: () {
                              Navigator.pushNamed(context, '/listening_part1');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 2: Sentence Completion",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/listening_part2_open_cloze');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 3: Multiple Choice",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/listening_part3_multiple_choice');
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Part 4: Multiple Choice",
                            onTap: () {
                              Navigator.pushNamed(context,
                                  '/listening_part4_key_word_transformation');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
