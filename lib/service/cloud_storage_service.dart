import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudStorageService {
  Future<void> changeProfilePicture() async {
    final picker = ImagePicker();
    final user = FirebaseAuth.instance.currentUser;

    // 1. Get the image file using an image picker library
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);

      // 2. Upload the image file to Firebase Storage
      final storage = FirebaseStorage.instance;
      final fileName =
          'images/users/profile_pictures/${user!.uid}_profile_picture.jpg';
      final fileRef = storage.ref().child(fileName);
      final uploadTask = fileRef.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // 3. Update the user's profile picture URL in Firestore
      final userDocRef =
          FirebaseFirestore.instance.collection('Users').doc(user.uid);
      await userDocRef.update({'profilePictureUrl': downloadUrl});
    }
  }

  // Delete the user's profile picture from Firebase Storage
  Future<void> deleteProfilePicture() async {
    final user = FirebaseAuth.instance.currentUser;
    final storage = FirebaseStorage.instance;
    final fileName =
        'images/users/profile_pictures/${user!.uid}_profile_picture.jpg';
    final fileRef = storage.ref().child(fileName);
    await fileRef.delete();
  }
}
