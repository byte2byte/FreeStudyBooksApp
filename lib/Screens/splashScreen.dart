import 'dart:async';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/Authentication/phoneVerificationScreen.dart';
import 'package:free_study_books_app/Screens/ChatScreen/chatScreen.dart';
import 'package:free_study_books_app/Screens/FIndBookScreen.dart';
import 'package:free_study_books_app/Screens/homeScreen.dart';
import 'package:free_study_books_app/Screens/postYourBookScreen/PostBookPhtosScreen.dart.dart';

import '../Utils/global.dart';

class MySplashScreen extends StatefulWidget {
  List<String> chatUsers = [];

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        final data1 = await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentFirebaseUser!.uid)
            .collection('recentChat')
            .get();
        data1.docs.forEach((element) {
          widget.chatUsers.add(element.id);
          // print(element.id);
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => HomeScreen()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (c) => PhoneVerificationScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo1.png"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Free Study Books",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
