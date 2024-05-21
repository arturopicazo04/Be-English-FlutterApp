import 'package:be_english/auth/auth.dart';
import 'package:be_english/components/custom_backbutton.dart';
import 'package:be_english/components/custom_button.dart';
import 'package:be_english/components/custom_profile_picture.dart';
import 'package:be_english/service/cloud_storage_service.dart';
import 'package:be_english/service/firebase_auth.dart';
import 'package:be_english/service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatabaseService {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.uid)
        .snapshots();
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  CloudStorageService cloudStorageService = CloudStorageService();
  DatabaseService databaseService = DatabaseService();
  FirebaseAuthService authservice = FirebaseAuthService();
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: databaseService.getUserDetails(),
          builder: (context, snapshot) {
            //loading...
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //Error
            else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            //Data received
            else if (snapshot.hasData) {
              Map<String, dynamic>? user = snapshot.data!.data();

              return Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, top: 50),
                      child: Row(
                        children: [
                          CustomBackButtom(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //profile picture
                    Stack(
                      children: [
                        Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,

                            //Profile Picture
                            child: ProfilePictureWidget(
                                user: user ?? {}, size: 200.0)),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              cloudStorageService.changeProfilePicture();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    //username
                    Text(
                      user?['username'] ?? 'Loading...',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    //email
                    Text(
                      user?['email'] ?? 'Loading...',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    //TODO: STATS

                    const Expanded(
                      child: SizedBox(),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomButton(
                            text: "Log Out",
                            onTap: () => authservice.signOut(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          //delete account
                          CustomButton(
                            text: "Delete Account?",
                            onTap: () {
                              cloudStorageService.deleteProfilePicture();
                              firestoreService.deleteUserDocument(user!['uid']);
                              authservice.deleteUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AuthPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("No data found"),
              );
            }
          }),
    );
  }
}
