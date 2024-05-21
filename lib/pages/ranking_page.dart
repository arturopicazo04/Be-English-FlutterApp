import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:be_english/components/custom_drawer.dart';
import 'package:be_english/components/custom_profile_picture.dart';
import 'package:be_english/service/firestore_service.dart';

class RankingPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Ranking"),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getUsersOrderedByProfileScore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No users found.'),
            );
          } else {
            final users = snapshot.data!.docs;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final userData = users[index].data() as Map<String, dynamic>;
                final profileScore = userData['score'];
                final username = userData['username'];

                return ListTile(
                  leading: ProfilePictureWidget(
                    user: userData,
                    size: 50.0,
                  ),
                  title: Text(username),
                  subtitle: Text('Profile Score: $profileScore'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
