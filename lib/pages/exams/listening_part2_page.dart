import 'package:be_english/components/custom_audio_player.dart';
import 'package:be_english/data/exam_data.dart';
import 'package:flutter/material.dart';

class ListeningPart2Page extends StatefulWidget {
  const ListeningPart2Page({super.key});

  @override
  _ListeningPart2PageState createState() => _ListeningPart2PageState();
}

class _ListeningPart2PageState extends State<ListeningPart2Page> {
  int _currentQuestionIndex = 0;
  final List<String?> _userAnswers = List.filled(8, null);

  void _showCorrectAnswers() {
    showCorrectAnswersDialog(context, ExamData.listeningPart2CorrectAnswers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Listening Part 2"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AudioPlayerWidget(assetPath: 'assets/audio/part2.mp3'),
            const SizedBox(height: 16),
            const Text(
              ExamData.listeningPar2Question,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              ExamData.listeningPart2Questions[_currentQuestionIndex],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) {
                _userAnswers[_currentQuestionIndex] = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your answer',
              ),
            ),
            const Spacer(),
            Visibility(
              visible: _currentQuestionIndex > 0,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentQuestionIndex > 0) {
                    setState(() {
                      _currentQuestionIndex--;
                    });
                  }
                },
                child: const Text('Previous'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_currentQuestionIndex < 7) {
                  setState(() {
                    _currentQuestionIndex++;
                  });
                } else {
                  _showCorrectAnswers();
                }
              },
              child: Text(_currentQuestionIndex < 7
                  ? 'Next Question'
                  : 'Show Correct Answers'),
            ),
          ],
        ),
      ),
    );
  }
}

void showCorrectAnswersDialog(
    BuildContext context, List<String> correctAnswers) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Correct Answers"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < correctAnswers.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Answer ${i + 1}: ${correctAnswers[i]}',
                        style: const TextStyle(color: Colors.yellow),
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
}
