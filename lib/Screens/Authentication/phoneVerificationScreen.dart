import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:free_study_books_app/Screens/Authentication/OtpScreen.dart';
import '../../Utils/BlueBtn.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, [int? forceCodeResent]) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
        Navigator.of(context)
            .pushReplacementNamed(OtpScreen.routeName, arguments: {
          'verificationId': verificationId,
          'phoneNumber': phoneNumber,
        });
        // print(phoneNumber);
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        // setState(() {
        //   authStatus = "TIMEOUT";
        // });
      },
    );
    // Navigator.of(context).pushNamed(OtpScreen.routeName);
  }

  String phoneNumber = '', verificationId = '';
  String authStatus = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            Container(
              child: Text(
                'Enter Your Phone Number',
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
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.phone_iphone,
                    color: Colors.cyan,
                  ),
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Enter Your Phone Number...",
                  fillColor: Colors.white70),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text('An OTP will be sent to this number for verification'),
            SizedBox(
              height: 2.0.h,
            ),
            BlueBtn(
              label: "Generate OTP",
              ontap: () {
                phoneNumber == '' ? null : verifyPhoneNumber(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
