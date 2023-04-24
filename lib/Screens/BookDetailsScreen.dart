import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/ChatScreen/chatScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BookDetailScreen extends StatefulWidget {
  static const routeName = '/book-detail-screen';

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  var Author = '';
  var Publisher = '';
  int NumberOfPages = 1;
  var NameOfBook = '';
  var userId = '';
  var BookDetails = '';
  double Price = 1.0;
  bool check = false;
  List<String> imgList = [];
  @override
  void didChangeDependencies() {
    if (check == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      if (routeArgs != null) {
        Author = routeArgs['Author'] as String;
        Publisher = routeArgs['Publisher'] as String;
        NumberOfPages = routeArgs['NumberOfPages'];
        NameOfBook = routeArgs['NameOfBook'] as String;
        userId = routeArgs['userId'] as String;
        Price = routeArgs['Price'];
        imgList = routeArgs['Images'];
        BookDetails = routeArgs['BookDetails'];
      }

      check = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(NameOfBook),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10)),
                height: 38.h,
                width: double.infinity.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GridTile(
                    child: CarouselSlider(
                      options: CarouselOptions(),
                      items: imgList
                          .map(
                            (item) => Image.network(item.toString(),
                                fit: BoxFit.fill, width: 1000),
                          )
                          .toList(),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.white,
                      leading: Text(
                        '$NameOfBook',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      title: Text(''),
                      trailing: Text(
                        '\$${Price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: TabBar(
                  indicatorColor: Colors.black54,
                  tabs: [
                    Tab(
                      child: Text(
                        'Details',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Description',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Seller',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // decoration: BoxDecoration(border: Border.all(width: 3)),
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                height: 30.h,
                width: double.infinity.w,
                child: TabBarView(
                  children: [
                    ListView(
                      // controller: ,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Author'),
                            Text(Author),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Publisher'),
                            Text(Publisher),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Condition'),
                            Text('Normal'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subject'),
                            Text('Nano Technology'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Are there any notes'),
                            Text('No'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Number of pages'),
                            Text('${NumberOfPages}'),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Text(BookDetails),
                    ),
                    Container(
                      child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            height: 5.h,
                            width: 5.h,
                            child: Image.network(
                                fit: BoxFit.cover,
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg'),
                          ),

                          // CircleAvatar(
                          //   backgroundImage: NetworkImage(
                          //       'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg'),
                          // ),
                          title: Text(
                            Publisher,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(children: [
                            Icon(
                              Icons.star,
                              size: 2.h,
                            ),
                            Icon(Icons.star, size: 2.h),
                            Icon(Icons.star, size: 2.h),
                            Icon(Icons.star, size: 2.h),
                            Icon(Icons.star_border, size: 2.h),
                          ]),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 4.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                'Send Message',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5.h,
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 6.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // BlueBtn(label: 'Buy Now', ontap: () {})
                  SizedBox(
                    height: 6.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Color.fromARGB(255, 126, 44, 233),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ChatScreen.routeName, arguments: {
                          'userId': userId,
                          'Publisher': Publisher,
                        });
                      },
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
