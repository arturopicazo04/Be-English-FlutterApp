import 'package:be_english/helper/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserDocument(
      UserCredential userCredential, String username) async {
    if (userCredential != null && userCredential.user != null) {
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'username': username,
        'profilePictureUrl': '',
        'stat_correctAnswers': 0,
        'stat_incorrectAnswers': 0,
      });
    }
  }

  Future<void> updateUserProfileScore(int score) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('Users').doc(userId).update({
        'score': FieldValue.increment(score),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUserDocument(String uid) async {
    await _firestore.collection("Users").doc(uid).delete();
  }

  Stream<QuerySnapshot> getUsersOrderedByProfileScore() {
    return _firestore
        .collection('Users')
        .orderBy('score', descending: true)
        .snapshots();
  }

  Future<Map<String, dynamic>> getUserData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Users').doc(userId).get();
      if (snapshot.exists) {
        return snapshot.data()!;
      } else {
        return {};
      }
    } catch (error) {
      displayMessageToUser("Error getting User Data", "" as BuildContext);
      return {};
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsersData() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Users').get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw 'Error getting user data: $e';
    }
  }
}
