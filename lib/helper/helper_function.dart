import 'package:flutter/material.dart';

//Display Error to User

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(title: (Text(message))),
  );
}
