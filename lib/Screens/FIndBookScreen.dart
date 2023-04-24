import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/BookDetailsScreen.dart';
import 'package:free_study_books_app/Widget/BookItem.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FindBookScreen extends StatefulWidget {
  static const routeName = '/find-book-screen';

  @override
  State<FindBookScreen> createState() => _FindBookScreenState();
}

class _FindBookScreenState extends State<FindBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          //IconButton(
          //     onPressed: () {
          //       FirebaseAuth.instance.signOut();
          //     },
          //     icon: Icon(Icons.logout)),
          Text(
            '  Find Your Textbook',
            style: TextStyle(
              fontSize: 7.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 7.h,
                width: 75.w,
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
                            // border: new OutlineInputBorder(
                            // borderRadius:
                            //     const BorderRadius.all(Radius.zero),
                            // borderSide: BorderSide()),
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
              Container(
                height: 7.h,
                width: 15.w,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 126, 44, 233),
                  border: Border.all(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: Icon(
                  Icons.filter_list_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 72.5.h,
            width: 100.w,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('PublishedBooks')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final documents = snapshot.data!.docs;
                  // print(documents.length);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: documents.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        final l = [...documents[index]['Images']].length;
                        Navigator.of(context)
                            .pushNamed(BookDetailScreen.routeName, arguments: {
                          'Author': documents[index]['Author'],
                          'Price': documents[index]['Price'],
                          'NameOfBook': documents[index]['NameOfBook'],
                          'userId': documents[index]['PublisherID'],
                          'Publisher': documents[index]['Publisher'],
                          'NumberOfPages': documents[index]['NumberOfPages'],
                          'Images': (documents[index]['Images'] as List)
                              .map((item) => item as String)
                              .toList(),
                        });
                      },
                      child: BookItem(
                        url: documents[index]['Images'][0],
                        author: documents[index]['Author'],
                        cost: documents[index]['Price'],
                        name: documents[index]['NameOfBook'],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
