import 'package:be_english/auth/auth.dart';
import 'package:be_english/firebase_options.dart';
import 'package:be_english/pages/exams/uoe_key_word_transformation.dart';
import 'package:be_english/pages/exams/uoe_open_cloze.dart';
import 'package:be_english/pages/exams/uoe_word_formation.dart';
import 'package:be_english/pages/forgot_pass_page.dart';
import 'package:be_english/pages/guides_page.dart';
import 'package:be_english/pages/home_page.dart';
import 'package:be_english/pages/interactive_exams_page.dart';
import 'package:be_english/pages/profile_page.dart';
import 'package:be_english/pages/ranking_page.dart';
import 'package:be_english/service/notification_service.dart';
import 'package:be_english/theme/dark_mode.dart';
import 'package:be_english/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService.initialize();
  NotificationService.scheduleDailyNotification();

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
        '/ranking_page': (context) => const RankingPage(),
        '/auth_page': (context) => const AuthPage(),
        '/guide_page': (context) => const GuidePage(),
        '/interactive_exams_page': (context) => const InteractiveExamsPage(),
        '/uoe_open_cloze': (context) => const OpenClozeExamPage(),
        '/uoe_word_formation': (context) => const WordFormationExamPage(),
        '/uoe_key_word_transformation': (context) => const KeyWordTransformationExamPage(),
      },
    );
  }
}
