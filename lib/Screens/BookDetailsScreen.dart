import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BookDetailScreen extends StatefulWidget {
  static const routeName = '/book-detail-screen';

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Title of Book'),
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
                            (item) => Image.network(item,
                                fit: BoxFit.fill, width: 1000),
                          )
                          .toList(),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.white,
                      leading: Text(
                        'Physics',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      title: Text(''),
                      trailing: Text(
                        '\$28.8',
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
                            Text('Tony Stark'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Publisher'),
                            Text('Edith'),
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
                            Text('Yes'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Number of pages'),
                            Text('500'),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                          'physics, science that deals with the structure of matter and the interactions between the fundamental constituents of the observable universe. In the broadest sense, physics (from the Greek physikos) is concerned with all aspects of nature on both the macroscopic and submicroscopic levels. Its scope of study encompasses not only the behaviour of objects under the action of given forces but also the nature and origin of gravitational, electromagnetic, and nuclear force fields. Its ultimate objective is the formulation of a few comprehensive principles that bring together and explain all such disparate phenomena.'),
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
                            'John wick',
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
                      onPressed: () {},
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
