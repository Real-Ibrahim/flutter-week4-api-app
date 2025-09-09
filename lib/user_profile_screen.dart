import 'package:flutter/material.dart';
import 'api_service.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  const UserProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.profilePicture),
            ),
            SizedBox(height: 16),
            Text('Name: ${user.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}