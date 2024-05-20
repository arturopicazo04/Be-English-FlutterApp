import 'package:cloud_firestore/cloud_firestore.dart';

enum Category {
  vocabulary,
  phrasalverbs,
}

class Quiz {
  final Category category;
  final List<Question> questions;
  Quiz({
    required this.category,
    required this.questions,
  });
}

class Question {
  String question;
  List<String> answers;
  String definition;
  String example;
  String verb;

  Question({
    required this.question,
    required this.answers,
    required this.definition,
    required this.example,
    required this.verb,
  });
}
