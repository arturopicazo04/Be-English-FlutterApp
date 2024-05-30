import 'package:cloud_firestore/cloud_firestore.dart';

class QuizService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getRandomQuestions(String collectionName) async {
    QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

    List<Map<String, dynamic>> allQuestions = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();

    allQuestions.shuffle();

    return allQuestions.take(5).toList();
  }
}
