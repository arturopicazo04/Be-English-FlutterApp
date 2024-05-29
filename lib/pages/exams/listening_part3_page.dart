import 'package:flutter/material.dart';
import 'package:be_english/components/custom_audio_player.dart';
import 'package:be_english/data/exam_data.dart';

class ListeningPart3Page extends StatefulWidget {
  const ListeningPart3Page({Key? key}) : super(key: key);

  @override
  _ListeningPart3PageState createState() => _ListeningPart3PageState();
}

class _ListeningPart3PageState extends State<ListeningPart3Page> {
  int _currentQuestionIndex = 0;
  final List<String?> _userAnswers = List.filled(6, null);

  void _checkAnswers() {
    List<bool> isAnswerCorrect = List.filled(_userAnswers.length, false);

    for (int i = 0; i < _userAnswers.length; i++) {
      if (_userAnswers[i] == ExamData.listeningPart3CorrectAnswers[i]) {
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
              for (int i = 0; i < ExamData.listeningPart3Questions.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Question ${i + 1}: ${ExamData.listeningPart3CorrectAnswers[i]}',
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Listening Part 3"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AudioPlayerWidget(assetPath: 'assets/audio/part3.mp3'),
            const SizedBox(height: 16),
            Text(
              '${_currentQuestionIndex + 1}. ${ExamData.listeningPart3Questions[_currentQuestionIndex]}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._buildOptions(_currentQuestionIndex),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    if (_currentQuestionIndex <
                        ExamData.listeningPart3Questions.length - 1) {
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    } else {
                      _checkAnswers();
                    }
                  },
                  child: Text(
                    _currentQuestionIndex <
                            ExamData.listeningPart3Questions.length - 1
                        ? 'Next Question'
                        : 'Submit',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions(int questionIndex) {
    return ExamData.listeningPart3Options[questionIndex].map((option) {
      return RadioListTile<String>(
        title: Text(option),
        value: option.substring(0, 1),
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
