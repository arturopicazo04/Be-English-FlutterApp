// ignore_for_file: use_build_context_synchronously

import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_textfield.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FortgotPasswordPage extends StatefulWidget {
  const FortgotPasswordPage({super.key});

  @override
  State<FortgotPasswordPage> createState() => _FortgotPasswordPageState();
}

class _FortgotPasswordPageState extends State<FortgotPasswordPage> {
  TextEditingController emailcontroller = TextEditingController();

  void resetPassword() async {
    // Get screen size
    double screenHeight = MediaQuery.of(context).size.height;

    //show loading circle
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: SizedBox(
            height: screenHeight * 0.06,
            width: screenHeight * 0.06,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    } catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "B E  E N G L I S H",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 25,
                ),
                // email textfield
                CustomTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailcontroller),

                const SizedBox(
                  height: 100,
                ),
                //reset password button
                CustomButton(text: "Reset Password", onTap: resetPassword),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
