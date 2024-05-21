import 'package:cloud_firestore/cloud_firestore.dart';

class QuizService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getRandomQuestions(String collectionName) async {
    // Get all documents from the specified collection
    QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

    // Convert the documents to a list of maps
    List<Map<String, dynamic>> allQuestions = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();

    // Shuffle the list to randomize it
    allQuestions.shuffle();

    // Return the first 5 elements (or less if there are not enough documents)
    return allQuestions.take(5).toList();
  }
}
