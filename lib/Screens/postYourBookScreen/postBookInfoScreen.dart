import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Widget/BookItem.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import 'package:free_study_books_app/Screens/postYourBookScreen/postBookDetailScreen.dart';
import 'package:free_study_books_app/Utils/BlueBtn.dart';
import '../../Models/Book.dart';
import '../../Utils/global.dart';

class PostBookInfoScreen extends StatefulWidget {
  static const routeName = '/post-book-info-screen';

  @override
  State<PostBookInfoScreen> createState() => _PostBookInfoScreenState();
}

class _PostBookInfoScreenState extends State<PostBookInfoScreen> {
  var book = Book();
  bool check = false;
  final _form = GlobalKey<FormState>();

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

  final levelDropDownList = [
    DropDownValueModel(name: 'primary', value: "primary"),
    DropDownValueModel(name: 'secondary', value: "secondary"),
    DropDownValueModel(name: 'graduation', value: "graduation"),
  ];
  final subjectDropDownList = [
    DropDownValueModel(name: 'Physics', value: "Physics"),
    DropDownValueModel(name: 'Chemistry', value: "Chemistry"),
    DropDownValueModel(name: 'maths', value: "maths"),
  ];
  final conditionDropDownList = [
    DropDownValueModel(name: 'great', value: "great"),
    DropDownValueModel(name: 'good', value: "good"),
    DropDownValueModel(name: 'bad', value: "bad"),
  ];
  final markDropDownList = [
    DropDownValueModel(name: 'yes', value: "yes"),
    DropDownValueModel(name: 'no', value: "no"),
  ];

  Future<void> _saveForm() async {
    final isValidate = _form.currentState?.validate();
    if (isValidate != null && isValidate == false) {
      return;
    }
    _form.currentState?.save();

    // print('..............................................');
    // print(book.NameOfBook);
    // print('condition${book.ConditionOfBook}');
    // print(book.LevelofBook);
    // print(book.NameOfBook);
    // print(book.NumberOfPages);
    // print(book.Publisher);
    // print(book.SubjectofBook);
    // print(book.description);
    // print(book.id);
    // print(book.imageUrl);
    // print(book.isMark);
    // print(book.Author);

    Navigator.of(context).pushNamed(PostBookDetailScreen.routeName, arguments: {
      'book': book as Book,
    });
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
                              return 'Required filed';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            book.NameOfBook = newValue!;
                          },
                        ),
                        //  textFieldMethod('Name of Book', nameOfBook),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          // initialValue: _initValues['title'],
                          decoration: InputDecoration(
                            labelText: 'Auhtor',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required filed';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            book.Author = newValue!;
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
                              return 'Required filed';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            book.Publisher = newValue!;
                          },
                        ),
                        // textFieldMethod('Publisher', Publisher),
                        SizedBox(
                          height: 1.h,
                        ),
                        DropDownTextField(
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            hintText: 'What level is your book',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: levelDropDownList.length,
                          dropDownList: levelDropDownList,
                          onChanged: (val) {
                            book.LevelofBook =
                                (val as DropDownValueModel).name.toString();
                          },
                        ),
                        // dropDownFieldMethod('What level is your book',
                        // levelDropDownList, levelOfBook),
                        SizedBox(
                          height: 1.h,
                        ),
                        DropDownTextField(
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            hintText: 'What subject is your book',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: subjectDropDownList.length,
                          dropDownList: subjectDropDownList,
                          onChanged: (val) {
                            book.SubjectofBook =
                                (val as DropDownValueModel).name.toString();
                          },
                        ),

                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
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
                            book.NumberOfPages = int.parse(newValue!);
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
                        DropDownTextField(
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            hintText: 'What is condition of your book',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: conditionDropDownList.length,
                          dropDownList: conditionDropDownList,
                          onChanged: (val) {
                            book.ConditionOfBook =
                                (val as DropDownValueModel).name.toString();
                          },
                        ),

                        SizedBox(
                          height: 1.h,
                        ),
                        DropDownTextField(
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            hintText: 'Is there any mark',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: markDropDownList.length,
                          dropDownList: markDropDownList,
                          onChanged: (val) {
                            if (val == 'yes')
                              book.isMark = true;
                            else {
                              book.isMark = false;
                            }
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
                            book.price = double.parse(newValue!);
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

//   TextFormField textFieldMethod(String text, String bookvalue) {
//     return TextFormField(
//       // initialValue: _initValues['title'],
//       decoration: InputDecoration(
//         labelText: text,
//         border: new OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(10),
//           ),
//         ),
//       ),
//       textInputAction: TextInputAction.next,

//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Required filed';
//         }
//         return null;
//       },
//       onSaved: (newValue) {
//         bookvalue = newValue!;
//       },
//     );
//   }

//   DropDownTextField dropDownFieldMethod(
//       String text, List<DropDownValueModel> list, String bookvalue) {
//     return DropDownTextField(
//       clearOption: true,
//       textFieldDecoration: InputDecoration(
//         hintText: text,
//         border: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(10),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value == null) {
//           return "Required field";
//         } else {
//           return null;
//         }
//       },
//       dropDownItemCount: list.length,
//       dropDownList: list,
//       onChanged: (val) {
//         bookvalue = val.toString();
//       },
//     );
//   }
}
