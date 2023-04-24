import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/Authentication/UserDetailScreen.dart';
import 'package:free_study_books_app/Screens/BookDetailsScreen.dart';
import 'package:free_study_books_app/Screens/homeScreen.dart';
import 'package:free_study_books_app/Utils/global.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Utils/BlueBtn.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp-screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  var phoneNumber;
  var check = false;
  var verificationId;
  @override
  void didChangeDependencies() {
    if (check == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      verificationId = routeArgs['verificationId'];
      setState(() {
        phoneNumber = routeArgs['phoneNumber'];
        // print(phoneNumber);
      });
      check = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Future<void> signIn(String otp) async {
    final userData = await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
    final userID = userData.user!.uid;

    final snapShot =
        await FirebaseFirestore.instance.collection('Users').doc(userID).get();

    if (snapShot == null || !snapShot.exists) {
      Navigator.of(context).pushNamed(UserDetailScreen.routeName, arguments: {
        'phoneNumber': phoneNumber,
      });
    } else {
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: (Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 7.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
              ),
              onChanged: (value) {
                otp = value;
              },
            ),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Text('We sent a an confirmation code to your number: ${phoneNumber}'),
          SizedBox(
            height: 2.0.h,
          ),
          BlueBtn(
            label: "Verify OTP",
            ontap: () {
              signIn(otp);
            },
          ),
        ]),
      )),
    );
  }
}
