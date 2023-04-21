import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/ChatScreen/chatScreen.dart';
import 'package:free_study_books_app/Utils/global.dart';
import 'package:free_study_books_app/Widget/MyMessagesItem.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class MyMessagesScreen extends StatefulWidget {
  static const routeName = '/my-messages-screen';

  @override
  State<MyMessagesScreen> createState() => _MyMessagesScreenState();
}

class _MyMessagesScreenState extends State<MyMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0.5.h,
          horizontal: 3.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              'My Messages',
              style: TextStyle(
                fontSize: 7.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 7.h,
              width: 100.w,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                ),
                borderRadius: BorderRadius.all(Radius.circular(9)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(7),
                          hintText: 'Search people or Message',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 27,
                    ),
                    SizedBox(
                      width: 1.h,
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 1.h,
            // ),
            Container(
                height: 65.5.h,
                width: 100.w,
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(currentFirebaseUser!.uid)
                      .collection('recentChat')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final documents = snapshot.data!.docs;
                    print('ok');
                    return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) =>
                          // Text(documents[index]['Publisher'])
                          GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ChatScreen.routeName, arguments: {
                            'userId': documents[index].id,
                            'Publisher': documents[index]['Name'],
                          });
                        },
                        child: MyMessagesItem(
                          documents[index]['Name'],
                          documents[index]['lastText'],
                          // documents[index]['createdAt'].toDate(),
                          // documents[index]['Publisher'] as String,
                          // documents[index]['text'] as String,
                          documents[index].id,
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
  // Container(
  //               height: 65.5.h,
  //               width: 100.w,
  //               child: StreamBuilder(
  //                 stream: FirebaseFirestore.instance
  //                     .collection('chat')
  //                     .doc(currentFirebaseUser!.uid).collection('')
  //                     .get()
  //                     .asStream(),
  //                 // .get(),/\
  //                 // .asStream(),
  //                 // .collection('dCm7SQGC8cVtTkfg8A7Q7McG2fQ2')
  //                 // .orderBy('createdAt', descending: true)
  //                 // .snapshots(),
  //                 // FirebaseFirestore.instance
  //                 //     .collection('chat')
  //                 //     .doc(
  //                 //         'O11qnoK8GaQEBtvdQKQ20RxIUB629CiSKIQHQvRNxRsP4yiEZ6sMZKi1')
  //                 //     .collection('PersonalChat')
  //                 //     .snapshots(),

  //                 builder: (context, snapshot) {
  //                   // print(currentFirebaseUser!.uid);
  //                   // print(snapshot.data?.data().toString());
  //                   print('id:${snapshot.data?.reference}');
  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //                     return Center(
  //                       child: CircularProgressIndicator(),
  //                     );
  //                   }
  //                   return ListView.builder(
  //                     itemCount: snapshot.data?.data()?.length,
  //                     itemBuilder: (context, index) {
  //                       print(snapshot.data?.data()?.length);
  //                       return Text(
  //                         snapshot.data?.data()?.keys.elementAt(index) ?? 'ok',
  //                       );
  //                     },
  //                   );
  //                   // final documents = snapshot.data!.docs;
  //                   // print('ok');
  //                   // return ListView.builder(
  //                   //   itemCount: documents.length,
  //                   //   itemBuilder: (context, index) => MyMessagesItem(
  //                   //     documents[index]['createdAt'].toDate(),
  //                   //     documents[index]['userName'] as String,
  //                   //     documents[index]['text'] as String,
  //                   //     documents[index]['userId'] as String,
  //                   //   ),
  //                   // );
  //                 },
  //               )),