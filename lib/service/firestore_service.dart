import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  

  Future<void> deleteUserDocument(String uid) async {
    await _firestore.collection("Users").doc(uid).delete();
  }
}
