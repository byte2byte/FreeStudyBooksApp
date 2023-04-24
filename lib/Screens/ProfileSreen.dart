import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/Authentication/phoneVerificationScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushReplacementNamed(PhoneVerificationScreen.routeName);
            },
            icon: Icon(Icons.logout),
            label: Text('log-out'),
          )
        ],
      ),
    );
  }
}
