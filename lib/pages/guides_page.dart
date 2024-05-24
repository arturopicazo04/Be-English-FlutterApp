import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  final List<Map<String, dynamic>> examParts = [
    {
      'title': 'Reading and Use of English',
      'description':
          'This section combines reading comprehension and language usage. It tests your ability to understand different types of texts and your knowledge and control of grammar and vocabulary.',
      'format': '8 parts, 56 questions in total.',
      'time': '1 hour 30 minutes.',
      'parts': [
        '- Multiple-choice cloze: A text with gaps that you fill by choosing from four options.',
        '',
        '- Open cloze: A text with gaps that you fill without given options.',
        '',
        '- Word formation: You need to form words derived from a given root.',
        '',
        '- Key word transformations: Rewrite a sentence using a given keyword, maintaining the same meaning.',
        '',
        '- Text with multiple-choice questions: A text followed by multiple-choice questions.',
        '',
        '- Gapped text: A text with paragraphs removed that you need to reorder correctly.',
        '',
        '- Multiple matching: A text or several short texts with statements to match to the text(s).'
      ]
    },
    {
      'title': 'Writing',
      'description':
          'This part assesses your ability to write various text types appropriate for different contexts, purposes, and audiences.',
      'format': '2 parts.',
      'time': '1 hour 30 minutes.',
      'parts': [
        '- Essay: You must write an essay based on two given points of view.',
        '',
        '- Choice of task: You can choose from various types of text (article, letter/email, report, proposal, etc.).'
      ]
    },
    {
      'title': 'Listening',
      'description':
          'This section tests your ability to understand a variety of spoken materials, such as news, speeches, and everyday conversations.',
      'format': '4 parts.',
      'time': 'Approximately 40 minutes.',
      'parts': [
        '- Multiple choice: Listen to an audio and answer multiple-choice questions.',
        '',
        '- Sentence completion: Listen to an audio and complete sentences with the missing information.',
        '',
        '- Multiple matching: Listen to several short audios and match information to statements.',
        '',
        '- Multiple choice: Similar to the first part but with a different audio and multiple-choice questions.'
      ]
    },
    {
      'title': 'Speaking',
      'description':
          'This part assesses your ability to communicate effectively in face-to-face conversations.',
      'format': '4 parts.',
      'time': '15 minutes per pair of candidates.',
      'parts': [
        '- Interview: Answer questions about yourself, your interests, etc.',
        '',
        '- Long turn: Describe a set of photographs and answer a related question.',
        '',
        '- Collaborative task: Discuss with the other candidate to reach an agreement on a given topic.',
        '',
        '- Discussion: Discuss the topic from part three further with the examiner.',
      ]
    }
  ];

  GuidePage({super.key});

  Widget buildExpansionTile(
      Map<String, dynamic> examPart, BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Theme.of(context).colorScheme.primary,
      ),
      child: ExpansionTile(
        title: Text(
          examPart['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        iconColor: Theme.of(context).colorScheme.primary,
        collapsedIconColor: Theme.of(context).colorScheme.primary,
        collapsedBackgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(examPart['description']),
              ],
            ),
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Format:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(examPart['format']),
              ],
            ),
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Time:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(examPart['time']),
              ],
            ),
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Parts:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                ...examPart['parts'].map<Widget>((part) => Text(part)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Guide'),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: examParts
            .map<Widget>((part) => buildExpansionTile(part, context))
            .toList(),
      ),
    );
  }
}
