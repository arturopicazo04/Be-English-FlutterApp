// ignore_for_file: use_build_context_synchronously

import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_textfield.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:be_english/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  void loginUser() async {
    if (emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty) {
      displayMessageToUser("Please fill in all fields", context);
    } else {
      UserCredential? userCredential = await _authService.loginUser(
        context: context,
        emailcontroller: emailcontroller,
        passwordcontroller: passwordcontroller,
        displayMessageToUser: (String message, context) {
          displayMessageToUser(message, context);
        },
      );
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
                //title
                const Text(
                  "B E  E N G L I S H",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(
                  height: 50,
                ),

                // email textfield
                CustomTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailcontroller),
                const SizedBox(
                  height: 10,
                ),
                //password textfield
                CustomTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordcontroller,
                  showToggleIcon: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // forgot password
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot_password_page');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //sign in button
                CustomButton(text: "Login", onTap: loginUser),
                //dont have an acoount]
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an account? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
