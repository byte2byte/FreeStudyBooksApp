import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/postYourBookScreen/postBookDetailScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:free_study_books_app/Utils/BlueBtn.dart';
import '../../Utils/global.dart';

class PostBookInfoScreen extends StatefulWidget {
  static const routeName = '/post-book-info-screen';

  @override
  State<PostBookInfoScreen> createState() => _PostBookInfoScreenState();
}

class _PostBookInfoScreenState extends State<PostBookInfoScreen> {
  var nameOfBook = '';
  var Author = '';
  var Publisher = '';
  var levelOfBook = '';
  var subjectOfBook = '';
  var NumberOfPages = 1;
  var ConditionOfBook = '';
  bool isThereanyMark = false;
  var Price = 1;
  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  Future<void> _saveForm() async {
    final isValidate = _form.currentState?.validate();
    if (isValidate != null && isValidate == false) {
      return;
    }
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    final userId = currentFirebaseUser!.uid;
    await FirebaseFirestore.instance.collection('Publishedbooks').add({
      'NameOfBook': nameOfBook,
      'Auhor': Author,
      'Publisher': Publisher,
      'NumberOfpages': NumberOfPages,
      'ConditionOfBook': ConditionOfBook,
      'Price': Price,
      'id': userId,
    });
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushNamed(PostBookDetailScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 5.h,
            // ),
            Text(
              'Sell Your Book',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 83.h,
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Book info',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Name of Book',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a Name of book';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            nameOfBook = newValue!;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Author',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide Author name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            Author = newValue!;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Publisher',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide Publisher Name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            Publisher = newValue!;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'What level is your book',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            // if (value!.isEmpty) {
                            //   return 'Please provide a level';
                            // }
                            return null;
                          },
                          onSaved: (newValue) {
                            // Publisher = newValue!;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'What subject is your book',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            // if (value!.isEmpty) {
                            //   return 'Please provide a subject name';
                            // }
                            return null;
                          },
                          onSaved: (newValue) {
                            // Publisher = newValue!;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Number of pages',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a value';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            NumberOfPages = int.parse(newValue!);
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Condition of the book',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'What is Condition of Your Book?',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide Condition';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            ConditionOfBook = newValue!;
                            // NumberOfPages = newValue! as int;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Is there any mark?',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            // if (value!.isEmpty) {
                            //   return 'Please provide  a value';
                            // }
                            return null;
                          },
                          onSaved: (newValue) {
                            // NumberOfPages = newValue! as int;
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Set a Price',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Price',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),

                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a value';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            Price = int.parse(newValue!);
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        BlueBtn(
                            label: 'Next',
                            ontap: () {
                              return _saveForm();
                            })
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
