import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String assetPath;

  const AudioPlayerWidget({super.key, required this.assetPath});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _player;
  Duration _audioDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  String? _currentAssetPath;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _currentAssetPath = widget.assetPath;
    try {
      await _player.setAsset(_currentAssetPath!);
      setState(() {
        _audioDuration = _player.duration!;
      });
      _player.positionStream.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  Future<void> _setNewAsset(String assetPath) async {
    _currentAssetPath = assetPath;
    try {
      await _player.setAsset(_currentAssetPath!);
      setState(() {
        _audioDuration = _player.duration!;
        _currentPosition = Duration.zero;
      });
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  @override
  void didUpdateWidget(covariant AudioPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.assetPath != _currentAssetPath) {
      _setNewAsset(widget.assetPath);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(_player.playing ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  _player.playing ? _player.pause() : _player.play();
                });
              },
            ),
            Text(_formatDuration(_currentPosition)),
            const Text(' / '),
            Text(_formatDuration(_audioDuration)),
          ],
        ),
        Slider(
          min: 0,
          max: _audioDuration.inSeconds.toDouble(),
          value: _currentPosition.inSeconds.toDouble(),
          onChanged: (value) {
            setState(() {
              _currentPosition = Duration(seconds: value.toInt());
              _player.seek(_currentPosition);
            });
          },
        ),
      ],
    );
  }
}
