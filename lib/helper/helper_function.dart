import 'package:flutter/material.dart';

//Display Error to User

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(title: (Text(message))),
  );
}


void showCorrectAnswersDialog(BuildContext context, List<String> correctAnswers) {
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
