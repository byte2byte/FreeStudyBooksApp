import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/Authentication/UserDetailScreen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:free_study_books_app/Screens/Authentication/OtpScreen.dart';
import 'package:free_study_books_app/Screens/BookDetailsScreen.dart';
import 'package:free_study_books_app/Screens/FIndBookScreen.dart';
import 'package:free_study_books_app/Screens/Authentication/phoneVerificationScreen.dart';
import 'package:free_study_books_app/Screens/PostYourBook.dart';
import './Utils/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FreeStudyBooksApp',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return FindBookScreen();
            }
            return PhoneVerificationScreen();
          }),
        ),
        routes: {
          BookDetailScreen.routeName: (context) => BookDetailScreen(),
          FindBookScreen.routeName: (context) => FindBookScreen(),
          OtpScreen.routeName: (context) => OtpScreen(),
          UserDetailScreen.routeName: (context) => UserDetailScreen(),
        },
      );
    });
  }
}
