import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //Drawer Header
                DrawerHeader(
                  child: Icon(Icons.book,
                      size: 60,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                //Home tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: const Text("H O M E"),
                    onTap: () {
                      // Already on home page
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ),

                //Profile tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: const Text("P R O F I L E"),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/profile_page');
                    },
                  ),
                ),
                //Ranking tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.leaderboard,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: const Text("R A N K I N G"),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/ranking_page');
                    },
                  ),
                ),
              ],
            ),
            //Logout tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text("L O G O U T"),
                onTap: () {
                  auth.signOut();
                  Navigator.pushReplacementNamed(context, '/auth_page');
                },
              ),
            )
          ],
        ));
  }
}
