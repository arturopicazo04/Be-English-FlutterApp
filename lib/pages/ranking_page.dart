// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:be_english/components/custom_drawer.dart';
import 'package:be_english/components/custom_profile_picture.dart';
import 'package:be_english/service/firestore_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final FirestoreService _firestoreService = FirestoreService();
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final users = await _firestoreService.getAllUsersData();
      setState(() {
        _users = users;
        _isLoading = false;
      });

      // Preload images
      for (var user in users) {
        if (user['profilePictureUrl'] != null &&
            user['profilePictureUrl'] != '') {
          precacheImage(
              CachedNetworkImageProvider(user['profilePictureUrl']), context);
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error loading user data: $e');
    }
  }

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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final userData = _users[index];
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
            ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'The score will be given by the quizzes exercises',
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
