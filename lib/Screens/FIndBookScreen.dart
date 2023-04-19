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
      appBar: AppBar(
        title: Text('Search a book'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  Find Your Textbook',
            style: TextStyle(
              fontSize: 7.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
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
            height: 74.7.h,
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
                  print(documents.length);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: documents.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(BookDetailScreen.routeName, arguments: {
                        'Author': documents[index]['Author'],
                        'Price': documents[index]['Price'],
                        'NameOfBook': documents[index]['NameOfBook'],
                        'userId': documents[index]['PublisherId'],
                        'Publisher': documents[index]['Publisher'],
                        'NumberOfPages': documents[index]['NumberOfpages'],
                      }),
                      child: BookItem(
                        url:
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
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
