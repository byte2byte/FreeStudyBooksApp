import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:free_study_books_app/Screens/BookDetailsScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/global.dart';
import 'package:free_study_books_app/Utils/BlueBtn.dart';

class UserDetailScreen extends StatefulWidget {
  static const routeName = '/user-detail-screen';

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  String userFirstName = '';
  String userLastName = '';
  var phoneNumber;
  var check = false;

  @override
  void didChangeDependencies() {
    if (check == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      setState(() {
        phoneNumber = routeArgs['phoneNumber'];
      });
      check = true;
    }
    super.didChangeDependencies();
  }

  Future<void> setUserName() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentFirebaseUser!.uid)
        .set({
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'phoneNumber': phoneNumber,
      'userId': currentFirebaseUser!.uid,
    });
    Navigator.of(context).pushReplacementNamed(BookDetailScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            child: Text(
              'Enter Your Name',
              style: TextStyle(
                fontSize: 7.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          TextField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
                filled: true,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 126, 44, 233),
                ),
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Enter Your First name",
                fillColor: Colors.white70),
            onChanged: (value) {
              userFirstName = value;
            },
          ),
          SizedBox(
            height: 3.h,
          ),
          TextField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
                filled: true,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 126, 44, 233),
                ),
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Enter Your Last name",
                fillColor: Colors.white70),
            onChanged: (value) {
              userLastName = value;
            },
          ),
          SizedBox(
            height: 3.h,
          ),
          BlueBtn(
            label: 'Proceed',
            ontap: setUserName,
          )
        ]),
      ),
    );
  }
}
