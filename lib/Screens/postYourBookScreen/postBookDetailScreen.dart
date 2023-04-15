import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/FIndBookScreen.dart';
import 'package:free_study_books_app/Utils/BlueBtn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostBookDetailScreen extends StatefulWidget {
  static const routeName = '/post-book-detail-screen';

  @override
  State<PostBookDetailScreen> createState() => _PostBookDetailScreenState();
}

class _PostBookDetailScreenState extends State<PostBookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Sell Your Book',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Details',
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            BlueBtn(
                label: 'Sell Book',
                ontap: () {
                  Navigator.of(context).pushNamed(FindBookScreen.routeName);
                })
          ])),
    );
  }
}
