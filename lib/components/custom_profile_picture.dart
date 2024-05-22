import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePictureWidget extends StatelessWidget {
  final Map<String, dynamic> user;
  final double size;

  const ProfilePictureWidget(
      {super.key, required this.user, required this.size});

  @override
  Widget build(BuildContext context) {
    return (user['profilePictureUrl'] == null ||
            user['profilePictureUrl'] == '')
        ? Icon(Icons.person,
            size: size, color: Theme.of(context).colorScheme.inversePrimary)
        : ClipOval(
            child: CachedNetworkImage(
              imageUrl: user['profilePictureUrl'],
              width: size,
              height: size,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error,
                  size: size,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          );
  }
}
