import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  final Map<String, dynamic> user;
  final double size;

  const ProfilePictureWidget({super.key, required this.user, required this.size});

  @override
  Widget build(BuildContext context) {
    return (user['profilePictureUrl'] == null ||
            user['profilePictureUrl'] == '')
        ? Icon(Icons.person,
            size: size, color: Theme.of(context).colorScheme.inversePrimary)
        : ClipOval(
            child: Image.network(
              user['profilePictureUrl'],
              width: size,
              height: size,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          );
  }
}
