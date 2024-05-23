import 'package:be_english/helper/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserDocument(
      UserCredential userCredential, String username) async {
    if (userCredential.user != null) {
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'username': username,
        'profilePictureUrl': '',
        'score': 0,
        'lastTestDate': '',
      });
    }
  }

  Future<void> updateUserProfileScore(int score) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DateTime currentDate = DateTime.now();
      // Add bonus points if the user has not taken the test today
      await FirebaseFirestore.instance.collection('Users').doc(userId).update({
        'score': FieldValue.increment(score),
        'lastTestDate': currentDate,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<int> calculateBonusPoints() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();
      Timestamp? lastTestTimestamp = userDoc['lastTestDate'] as Timestamp?;
      if (lastTestTimestamp != null) {
        DateTime lastTestDate = lastTestTimestamp.toDate();
        DateTime currentDate = DateTime.now();

        if (lastTestDate.year != currentDate.year ||
            lastTestDate.month != currentDate.month ||
            lastTestDate.day != currentDate.day) {
          return 50;
        }
      }
    } catch (e) {
      print('Error al calcular el bono de puntos: $e');
    }
    return 0;
  }

  Future<void> deleteUserDocument(String uid) async {
    await _firestore.collection("Users").doc(uid).delete();
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
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('score',
              isGreaterThanOrEqualTo:
                  0) // Filtra usuarios con puntuación mayor que 0
          .orderBy('score', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error getting all users data: $e');
      throw Exception('Error getting all users data');
    }
  }
}
