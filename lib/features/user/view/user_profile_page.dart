// lib/features/user/view/user_profile_page.dart
import 'package:flutter/material.dart';
import 'package:manga/core/constant/colors.dart';
import 'package:manga/features/user/view/user_settings_page.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String username = 'EMON';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: AppColors.textColor)),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/icon/profile_picture.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              username,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.person, color: AppColors.subTextColor),
              title: Text('User Settings', style: TextStyle(color: AppColors.textColor)),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.subTextColor),
              onTap: () async {
                final updatedName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSettingsPage(currentName: username),
                  ),
                );
                if (updatedName != null) {
                  setState(() {
                    username = updatedName;
                  });
                }
              },
            ),
            Divider(color: AppColors.subTextColor),
            ListTile(
              leading: Icon(Icons.help_outline, color: AppColors.subTextColor),
              title: Text('FAQ', style: TextStyle(color: AppColors.textColor)),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.subTextColor),
            ),
            Divider(color: AppColors.subTextColor),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.subTextColor),
              title: Text('Logout', style: TextStyle(color: AppColors.textColor)),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.subTextColor),
            ),
            Divider(color: AppColors.subTextColor),
          ],
        ),
      ),
    );
  }
}
