// ignore_for_file: use_build_context_synchronously
import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_textfield.dart';
import 'package:be_english/helper/helper_function.dart';
import 'package:be_english/service/firebase_auth.dart';
import 'package:be_english/service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  void registerUser() async {
    FirebaseAuthService authService = FirebaseAuthService();
    FirestoreService firestoreService = FirestoreService();

    if (emailcontroller.text.isEmpty ||
        passwordcontroller.text.isEmpty ||
        confirmpasswordcontroller.text.isEmpty ||
        usernamecontroller.text.isEmpty) {
      displayMessageToUser("Please fill in all fields", context);
    } else {
      UserCredential? userCredential = await authService.registerUser(
        context: context,
        emailcontroller: emailcontroller,
        passwordcontroller: passwordcontroller,
        confirmpasswordcontroller: confirmpasswordcontroller,
        displayMessageToUser: displayMessageToUser,
      );

      if (userCredential != null) {
        firestoreService.createUserDocument(
            userCredential, usernamecontroller.text);
      }
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
                  padding: const EdgeInsets.only(
                      top: 50.0), // Adjust the value as needed
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
                // Username textfield
                CustomTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernamecontroller),
                const SizedBox(
                  height: 10,
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
                    controller: passwordcontroller),
                const SizedBox(
                  height: 10,
                ),
                //Confirmpassword textfield
                CustomTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    controller: confirmpasswordcontroller),
                const SizedBox(
                  height: 25,
                ),

                //sign Up button
                CustomButton(text: "Register", onTap: registerUser),
                //Already have an account?]
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
