import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/FIndBookScreen.dart';
import 'package:free_study_books_app/Screens/homeScreen.dart';
import 'package:free_study_books_app/Utils/BlueBtn.dart';
import 'package:free_study_books_app/Utils/global.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Models/Book.dart';

class PostBookDetailScreen extends StatefulWidget {
  static const routeName = '/post-book-detail-screen';

  @override
  State<PostBookDetailScreen> createState() => _PostBookDetailScreenState();
}

class _PostBookDetailScreenState extends State<PostBookDetailScreen> {
  var book = Book();
  bool check = false;

  void sellBook() async {
    await FirebaseFirestore.instance.collection('PublishedBooks').add({
      'NameOfBook': book.NameOfBook,
      'Author': book.Author,
      'Publisher': book.Publisher,
      'Level': book.LevelofBook,
      'Subject': book.SubjectofBook,
      'Condition': book.ConditionOfBook,
      'IsMark': book.isMark,
      'NumberOfPages': book.NumberOfPages,
      'Price': book.price,
      'PublisherID': currentFirebaseUser!.uid,
      'BookId': book.id,
      'Images': book.imageUrl,
      'details': book.description,
    });
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  void didChangeDependencies() {
    if (check == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, Book>;
      book = routeArgs['book']! as Book;
      check = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Add description')),
      body: Container(
          padding: EdgeInsets.all(8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 1.h,
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
            Text(
              'And the final Step. add more details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10),
                  ),
                ),
                hintText:
                    'Add more details of your book.It\'s conditon,marks, and etc. It will increase your chances to sell a book.',
                // labelText: 'Details',
              ),
              minLines: 10,
              maxLines: 14,
              onChanged: (value) {
                book.description = value;
                book.id = DateTime.now().toString();
              },
            ),
            SizedBox(
              height: 45.h,
            ),
            BlueBtn(
                label: 'Sell Book',
                ontap: () {
                  sellBook();
                })
          ])),
    );
  }
}
