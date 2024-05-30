import 'package:flutter/material.dart';

class CustomMultipleChoice extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(String) onSelected;

  const CustomMultipleChoice({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomMultipleChoiceState createState() => _CustomMultipleChoiceState();
}

class _CustomMultipleChoiceState extends State<CustomMultipleChoice> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.question,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          for (var option in widget.options)
            RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  widget.onSelected(value);
                });
              },
            ),
        ],
      ),
    );
  }
}
