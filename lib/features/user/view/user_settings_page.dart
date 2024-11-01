// lib/features/user/view/user_settings_page.dart
import 'package:flutter/material.dart';

class UserSettingsPage extends StatelessWidget {
  final TextEditingController _usernameController;
  final String currentName;

  UserSettingsPage({required this.currentName}) : _usernameController = TextEditingController(text: currentName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Change Username'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _usernameController.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
