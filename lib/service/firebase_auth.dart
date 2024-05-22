// ignore_for_file: use_build_context_synchronously

import 'package:be_english/pages/full_screen_loader_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> registerUser({
    required BuildContext context,
    required TextEditingController emailcontroller,
    required TextEditingController passwordcontroller,
    required TextEditingController confirmpasswordcontroller,
    required Function displayMessageToUser,
  }) async {
    // Show loading circle
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const FullScreenLoader(),
    );

    // Make sure password and confirm password match
    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      Navigator.pop(context);
      displayMessageToUser("Passwords do not match", context);
      return null;
    } else {
      // Try creating the user
      try {
        UserCredential? userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );

        Navigator.pop(context);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      } catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.toString(), context);
      }
    }
    return null;
  }

  Future<UserCredential?> loginUser({
    required BuildContext context,
    required TextEditingController emailcontroller,
    required TextEditingController passwordcontroller,
    required Function displayMessageToUser,
  }) async {
    // Show loading circle
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const FullScreenLoader(),
    );

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      if (context.mounted) Navigator.pop(context);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    } catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.toString(), context);
    }
    return null;
  }

  Future<void> deleteUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await currentUser.delete();
    }
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }
}
