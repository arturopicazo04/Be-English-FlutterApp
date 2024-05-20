import 'package:flutter/material.dart';

class CustomBackButtom extends StatelessWidget {
  const CustomBackButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.background,
          ),
        ));
  }
}
