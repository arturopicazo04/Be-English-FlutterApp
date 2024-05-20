import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.red.shade50,
    primary: Colors.red.shade200,
    secondary: Colors.red.shade400,
    inversePrimary: Colors.red.shade600,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey.shade800,
        displayColor: Colors.black,
      ),
);
