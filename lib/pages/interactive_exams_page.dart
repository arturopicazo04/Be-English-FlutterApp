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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle(context, "Reading and Use Of English"),
                _buildReadingButtons(context),
                const SizedBox(height: 30),
                _buildSectionTitle(context, "Listening"),
                _buildListeningButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildReadingButtons(BuildContext context) {
    return Column(
      children: [
        _buildExamCard(
          context,
          title: "Part 1: Multiple Choice",
          icon: Icons.format_list_numbered,
          route: '/reading_part1_multiple_choice_cloze',
        ),
        _buildExamCard(
          context,
          title: "Part 2: Open Cloze",
          icon: Icons.edit,
          route: '/uoe_part2_open_cloze',
        ),
        _buildExamCard(
          context,
          title: "Part 3: Word Formation",
          icon: Icons.text_fields,
          route: '/uoe_part3_word_formation',
        ),
        _buildExamCard(
          context,
          title: "Part 4: Key Word Transformation",
          icon: Icons.transform,
          route: '/uoe_part4_key_word_transformation',
        ),
        _buildExamCard(
          context,
          title: "Part 5: Multiple Choice",
          icon: Icons.check_circle_outline,
          route: '/reading_part5_multiple_choice',
        ),
        _buildExamCard(
          context,
          title: "Part 6: Gapped Text",
          icon: Icons.short_text,
          route: '/reading_part6_open_cloze',
        ),
        _buildExamCard(
          context,
          title: "Part 7: Multiple Matching",
          icon: Icons.swap_horiz,
          route: '/reading_part7_multiple_choice',
        ),
      ],
    );
  }

  Widget _buildListeningButtons(BuildContext context) {
    return Column(
      children: [
        _buildExamCard(
          context,
          title: "Part 1: Multiple Choice",
          icon: Icons.hearing,
          route: '/listening_part1',
        ),
        _buildExamCard(
          context,
          title: "Part 2: Sentence Completion",
          icon: Icons.note_add,
          route: '/listening_part2_open_cloze',
        ),
        _buildExamCard(
          context,
          title: "Part 3: Multiple Choice",
          icon: Icons.hearing,
          route: '/listening_part3_multiple_choice',
        ),
        _buildExamCard(
          context,
          title: "Part 4: Multiple Choice",
          icon: Icons.hearing,
          route: '/listening_part4_key_word_transformation',
        ),
      ],
    );
  }

  Widget _buildExamCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String route,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
