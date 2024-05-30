import 'package:flutter/material.dart';
import 'package:be_english/components/custom_audio_player.dart';
import 'package:be_english/data/exam_data.dart';

class ListeningPart4Page extends StatefulWidget {
  const ListeningPart4Page({super.key});

  @override
  _ListeningPart4PageState createState() => _ListeningPart4PageState();
}

class _ListeningPart4PageState extends State<ListeningPart4Page> {
  int _currentTaskIndex = 0;
  final List<String?> _userAnswersTaskOne = List.filled(5, null);
  final List<String?> _userAnswersTaskTwo = List.filled(5, null);

  void _checkAnswers() {
    List<bool> isAnswerCorrectTaskOne =
        List.filled(_userAnswersTaskOne.length, false);
    List<bool> isAnswerCorrectTaskTwo =
        List.filled(_userAnswersTaskTwo.length, false);

    for (int i = 0; i < _userAnswersTaskOne.length; i++) {
      if (_userAnswersTaskOne[i] ==
          ExamData.listeningPart4CorrectAnswersTaskOne[i]) {
        isAnswerCorrectTaskOne[i] = true;
      }
    }

    for (int i = 0; i < _userAnswersTaskTwo.length; i++) {
      if (_userAnswersTaskTwo[i] ==
          ExamData.listeningPart4CorrectAnswersTaskTwo[i]) {
        isAnswerCorrectTaskTwo[i] = true;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Task One:'),
                for (int i = 0; i < _userAnswersTaskOne.length; i++)
                  Row(
                    children: <Widget>[
                      Icon(
                        isAnswerCorrectTaskOne[i] ? Icons.check : Icons.close,
                        color: isAnswerCorrectTaskOne[i]
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Answer ${i + 1}: ${isAnswerCorrectTaskOne[i] ? "Correct" : "Incorrect"}',
                          style: TextStyle(
                            color: isAnswerCorrectTaskOne[i]
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                const Text('Task Two:'),
                for (int i = 0; i < _userAnswersTaskTwo.length; i++)
                  Row(
                    children: <Widget>[
                      Icon(
                        isAnswerCorrectTaskTwo[i] ? Icons.check : Icons.close,
                        color: isAnswerCorrectTaskTwo[i]
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Answer ${i + 1}: ${isAnswerCorrectTaskTwo[i] ? "Correct" : "Incorrect"}',
                          style: TextStyle(
                            color: isAnswerCorrectTaskTwo[i]
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
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
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Task One:'),
                for (int i = 0;
                    i < ExamData.listeningPart4QuestionsTaskOne.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Question ${i + 1}: ${ExamData.listeningPart4CorrectAnswersTaskOne[i]}',
                            style: const TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                const Text('Task Two:'),
                for (int i = 0;
                    i < ExamData.listeningPart4QuestionsTaskTwo.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Question ${i + 1}: ${ExamData.listeningPart4CorrectAnswersTaskTwo[i]}',
                            style: const TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AudioPlayerWidget(assetPath: 'assets/audio/part4.mp3'),
            const SizedBox(height: 16),
            _currentTaskIndex == 0 ? _buildTaskOne() : _buildTaskTwo(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _currentTaskIndex > 0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentTaskIndex--;
                      });
                    },
                    child: const Text('Previous'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentTaskIndex < 1) {
                      setState(() {
                        _currentTaskIndex++;
                      });
                    } else {
                      _checkAnswers();
                    }
                  },
                  child: Text(
                    _currentTaskIndex < 1 ? 'Next Task' : 'Submit',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < ExamData.listeningPart4QuestionsTaskOne.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ExamData.listeningPart4QuestionsTaskOne[i],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ..._buildOptionsTaskOne(i),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }

  Widget _buildTaskTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < ExamData.listeningPart4QuestionsTaskTwo.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ExamData.listeningPart4QuestionsTaskTwo[i],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ..._buildOptionsTaskTwo(i),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }

  List<Widget> _buildOptionsTaskOne(int questionIndex) {
    return ExamData.listeningPart4OptionsTaskOne.map((option) {
      return RadioListTile<String>(
        title: Text(option),
        value: option.split(' ')[0],
        groupValue: _userAnswersTaskOne[questionIndex],
        onChanged: (value) {
          setState(() {
            _userAnswersTaskOne[questionIndex] = value!;
          });
        },
      );
    }).toList();
  }

  List<Widget> _buildOptionsTaskTwo(int questionIndex) {
    return ExamData.listeningPart4OptionsTaskTwo.map((option) {
      return RadioListTile<String>(
        title: Text(option),
        value: option.split(' ')[0],
        groupValue: _userAnswersTaskTwo[questionIndex],
        onChanged: (value) {
          setState(() {
            _userAnswersTaskTwo[questionIndex] = value!;
          });
        },
      );
    }).toList();
  }
}
