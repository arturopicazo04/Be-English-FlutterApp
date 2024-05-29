import 'package:be_english/components/custom_audio_player.dart';
import 'package:be_english/data/exam_data.dart';
import 'package:flutter/material.dart';

class ListeningPart1Page extends StatefulWidget {
  const ListeningPart1Page({super.key});

  @override
  _ListeningPart1PageState createState() => _ListeningPart1PageState();
}

class _ListeningPart1PageState extends State<ListeningPart1Page> {
  int _currentAudioIndex = 0;
  int _currentQuestionIndex = 0;
  final List<String?> _userAnswers = List.filled(6, null);

  final List<String> _correctAnswers = ExamData.listeningPart1CorrectAnswers;
  final List<String> _questions = ExamData.listeningPart1Questions;
  final List<List<String>> _options = ExamData.listeningPart1Options;

  final List<String> _audioPaths = [
    'assets/audio/extract1.mp3',
    'assets/audio/extract2.mp3',
    'assets/audio/extract3.mp3',
  ];

  void _checkAnswers() {
    List<bool> isAnswerCorrect = List.filled(_userAnswers.length, false);

    for (int i = 0; i < _userAnswers.length; i++) {
      if (_userAnswers[i] == _correctAnswers[i]) {
        isAnswerCorrect[i] = true;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 0; i < _userAnswers.length; i++)
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                _showCorrectAnswers();
              },
              child: const Text('Show Correct Answers'),
            ),
          ],
        );
      },
    );
  }

  void _showCorrectAnswers() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Correct Answers'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < _questions.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Question ${i + 1}: ${_correctAnswers[i]}',
                          style: const TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening Part 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AudioPlayerWidget(assetPath: _audioPaths[_currentAudioIndex]),
            const SizedBox(height: 16),
            Text(
              _questions[_currentAudioIndex * 2 + _currentQuestionIndex],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ..._buildOptions(
              _currentAudioIndex * 2 + _currentQuestionIndex,
              _options[_currentAudioIndex * 2 + _currentQuestionIndex],
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
                if (_currentQuestionIndex < 1) {
                  setState(() {
                    _currentQuestionIndex++;
                  });
                } else if (_currentAudioIndex < 2) {
                  setState(() {
                    _currentAudioIndex++;
                    _currentQuestionIndex = 0;
                  });
                } else {
                  _checkAnswers();
                }
              },
              child: Text(_currentQuestionIndex < 1
                  ? 'Next Question'
                  : _currentAudioIndex < 2
                      ? 'Next Audio'
                      : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions(int questionIndex, List<String> options) {
    return options.map((option) {
      return RadioListTile<String>(
        title: Text(option),
        value: option[0],
        groupValue: _userAnswers[questionIndex],
        onChanged: (value) {
          setState(() {
            _userAnswers[questionIndex] = value!;
          });
        },
      );
    }).toList();
  }
}
