import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/BookDetailsScreen.dart';
import 'package:free_study_books_app/Screens/FIndBookScreen.dart';
import 'package:free_study_books_app/Screens/OTPScreen.dart';
import 'package:free_study_books_app/Screens/PostYourBook.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FreeStudyBooksApp',
        home: FindBookScreen(),
        routes: {
          BookDetailScreen.routeName: (context) => BookDetailScreen(),
        },
      );
    });
  }
}
