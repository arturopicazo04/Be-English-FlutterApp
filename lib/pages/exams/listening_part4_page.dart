import 'package:flutter/material.dart';
import 'package:be_english/components/custom_audio_player.dart';
import 'package:be_english/data/exam_data.dart';

class ListeningPart4Page extends StatefulWidget {
  const ListeningPart4Page({Key? key}) : super(key: key);

  @override
  _ListeningPart4PageState createState() => _ListeningPart4PageState();
}

class _ListeningPart4PageState extends State<ListeningPart4Page> {
  int _currentSpeakerIndex = 0;
  final List<String?> _userAnswersTask1 = List.filled(5, null);
  final List<String?> _userAnswersTask2 = List.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Listening Part 4"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AudioPlayerWidget(assetPath: 'assets/audio/part4.mp3'),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTask1(),
                      const SizedBox(height: 16),
                      _buildTask2(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _currentSpeakerIndex > 0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentSpeakerIndex > 0) {
                        setState(() {
                          _currentSpeakerIndex--;
                        });
                      }
                    },
                    child: const Text('Previous'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentSpeakerIndex < 4) {
                      setState(() {
                        _currentSpeakerIndex++;
                      });
                    }
                  },
                  child: Text(
                    _currentSpeakerIndex < 4 ? 'Next Speaker' : 'Submit',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTask1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reason for changing job:',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ..._buildOptions(_currentSpeakerIndex,
            ExamData.listeningPart4Options.sublist(0, 8), _userAnswersTask1),
      ],
    );
  }

  Widget _buildTask2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Feeling about new job:',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ..._buildOptions(_currentSpeakerIndex,
            ExamData.listeningPart4Options.sublist(8, 16), _userAnswersTask2),
      ],
    );
  }

  List<Widget> _buildOptions(
      int speakerIndex, List<String> optionsList, List<String?> userAnswers) {
    return optionsList.map((option) {
      return RadioListTile<String>(
        title: Text(option),
        value: option.split(' ')[0],
        groupValue: userAnswers[speakerIndex],
        onChanged: (value) {
          setState(() {
            userAnswers[speakerIndex] = value!;
          });
        },
      );
    }).toList();
  }
}
