import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudStorageService {
  Future<void> changeProfilePicture() async {
    final picker = ImagePicker();
    final user = FirebaseAuth.instance.currentUser;

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);

      final storage = FirebaseStorage.instance;
      final fileName =
          'images/users/profile_pictures/${user!.uid}_profile_picture.jpg';
      final fileRef = storage.ref().child(fileName);
      final uploadTask = fileRef.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      final userDocRef =
          FirebaseFirestore.instance.collection('Users').doc(user.uid);
      await userDocRef.update({'profilePictureUrl': downloadUrl});
    }
  }

  Future<void> deleteProfilePicture() async {
    final user = FirebaseAuth.instance.currentUser;
    final storage = FirebaseStorage.instance;
    final fileName =
        'images/users/profile_pictures/${user!.uid}_profile_picture.jpg';
    final fileRef = storage.ref().child(fileName);

    try {
      await fileRef.getDownloadURL();
      await fileRef.delete();
    } catch (e) {
      print('No file exists at this path');
    }
  }
}
