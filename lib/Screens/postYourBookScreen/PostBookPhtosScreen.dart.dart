// import 'dart:html';
import 'dart:io' as File;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/postYourBookScreen/postBookInfoScreen.dart';
import 'package:free_study_books_app/Utils/BlueBtn.dart';
import 'package:free_study_books_app/Utils/KStyles.dart';
import 'package:free_study_books_app/Utils/global.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Models/Book.dart';

class PostBookPhotosScreen extends StatefulWidget {
  static const routeName = '/post-book-photos-screen';

  @override
  State<PostBookPhotosScreen> createState() => _PostBookPhotosScreenState();
}

class _PostBookPhotosScreenState extends State<PostBookPhotosScreen> {
  var coverURL = '';
  var titleURL = '';
  var pageURL1 = '';
  var pageURL2 = '';

  var _isLoading = false;

  var book = Book();

  Future<String> uploadImagesFunction(image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('published-books')
        .child(currentFirebaseUser!.uid + image.name + 'jpg');

    await ref.putFile(File.File(image.path)).whenComplete(() => null);

    final url = await ref.getDownloadURL();

    return url;
  }

  Future<String> _pickImage(String url) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    final downlodedUrl = await uploadImagesFunction(pickedImage);
    setState(() {
      url = downlodedUrl;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Image added')));
    print('images addded to list');
    return downlodedUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 100.0.h,
        width: 100.0.w,
        padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 5.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 1.0.h,
            ),
            Text(
              "Sell Your Book",
              style: Kstyles.headingStyle,
            ),
            kVerticalSpace(),
            Text(
              "Add some Photos",
              style: Kstyles.subHeadingStyle,
            ),
            kVerticalSpace(),
            kVerticalSpace(),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final getUrl = await _pickImage(coverURL);
                          setState(() {
                            coverURL = getUrl;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.0.w, vertical: 1.0.h),
                          height: 22.0.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(3.0.w)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book cover photo',
                                style: Kstyles.subHeadingStyle
                                    .copyWith(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              coverURL != ''
                                  ? Expanded(
                                      child: Container(
                                        height: 15.5.h,
                                        width: 40.w,
                                        child: Image.network(
                                          coverURL,
                                          fit: BoxFit.fill,
                                          width: 1000,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius:
                                                BorderRadius.circular(2.0.w)),
                                        child: Center(
                                            child: Icon(
                                          size: 20.w,
                                          Icons.photo_camera_sharp,
                                          color: Colors.yellow,
                                        )),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // UploadPhotoWidget('Book cover photo', coverURL),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final getUrl = await _pickImage(titleURL);
                          setState(() {
                            titleURL = getUrl;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.0.w, vertical: 1.0.h),
                          height: 22.0.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(3.0.w)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book title photo',
                                style: Kstyles.subHeadingStyle
                                    .copyWith(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              titleURL != ''
                                  ? Expanded(
                                      child: Container(
                                        height: 15.5.h,
                                        width: 40.w,
                                        child: Image.network(
                                          titleURL,
                                          fit: BoxFit.fill,
                                          width: 1000,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius:
                                                BorderRadius.circular(2.0.w)),
                                        child: Center(
                                            child: Icon(
                                          size: 20.w,
                                          Icons.photo_camera_sharp,
                                          color: Colors.yellow,
                                        )),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final getUrl = await _pickImage(pageURL1);
                          setState(() {
                            pageURL1 = getUrl;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.0.w, vertical: 1.0.h),
                          height: 22.0.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(3.0.w)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book pages Photo 1',
                                style: Kstyles.subHeadingStyle
                                    .copyWith(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              pageURL1 != ''
                                  ? Expanded(
                                      child: Container(
                                        height: 15.5.h,
                                        width: 40.w,
                                        child: Image.network(
                                          pageURL1,
                                          fit: BoxFit.fill,
                                          width: 1000,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius:
                                                BorderRadius.circular(2.0.w)),
                                        child: Center(
                                            child: Icon(
                                          size: 20.w,
                                          Icons.photo_camera_sharp,
                                          color: Colors.yellow,
                                        )),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final getUrl = await _pickImage(pageURL2);
                          setState(() {
                            pageURL2 = getUrl;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.0.w, vertical: 1.0.h),
                          height: 22.0.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(3.0.w)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book pages Photo 2',
                                style: Kstyles.subHeadingStyle
                                    .copyWith(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              pageURL2 != ''
                                  ? Expanded(
                                      child: Container(
                                        height: 15.5.h,
                                        width: 40.w,
                                        child: Image.network(
                                          pageURL2,
                                          fit: BoxFit.fill,
                                          width: 1000,
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius:
                                                BorderRadius.circular(2.0.w)),
                                        child: Center(
                                            child: Icon(
                                          size: 20.w,
                                          Icons.photo_camera_sharp,
                                          color: Colors.yellow,
                                        )),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            _isLoading == true
                ? Container(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : BlueBtn(
                    label: "Next",
                    ontap: () {
                      if (coverURL != '' &&
                          titleURL != '' &&
                          pageURL1 != '' &&
                          pageURL2 != '') {
                        book.imageUrl = [
                          coverURL,
                          titleURL,
                          pageURL1,
                          pageURL2
                        ];
                        Navigator.of(context).pushNamed(
                            PostBookInfoScreen.routeName,
                            arguments: {
                              'book': book,
                            });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please upload all images')));
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }

  SizedBox kVerticalSpace() {
    return SizedBox(
      height: 2.0.h,
    );
  }
}
