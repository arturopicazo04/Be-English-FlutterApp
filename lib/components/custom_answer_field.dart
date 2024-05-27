import 'package:flutter/material.dart';

class CustomAnswerField extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final bool isCorrect;
  final ValueChanged<String>? onChanged;

  const CustomAnswerField({
    super.key,
    required this.controller,
    required this.index,
    required this.isCorrect,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: "Answer ${index + 1}",
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: isCorrect
                  ? Colors.green
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isCorrect
                  ? Colors.green
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
