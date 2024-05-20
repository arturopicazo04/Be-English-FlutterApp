import 'package:be_english/auth/auth.dart';
import 'package:be_english/firebase_options.dart';
import 'package:be_english/pages/forgot_pass_page.dart';
import 'package:be_english/pages/home_page.dart';
import 'package:be_english/pages/phrasal_verbs_quiz_page.dart';
import 'package:be_english/pages/profile_page.dart';
import 'package:be_english/pages/vocabulary_quiz_page.dart';
import 'package:be_english/theme/dark_mode.dart';
import 'package:be_english/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/home': (context) => const HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/forgot_password_page': (context) => const FortgotPasswordPage(),
        '/phrasal_verbs_quiz_page': (context) => const PhrasalVerbsQuizPage(),
        '/vocabulary_quiz_page': (context) => const VocabularyQuizPage(),
      },
    );
  }
}
