import 'package:be_english/auth/login_or_register.dart';
import 'package:be_english/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is Logged
          if (snapshot.hasData) {
            return const HomePage();
          }
          // User is NOT Logged
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}