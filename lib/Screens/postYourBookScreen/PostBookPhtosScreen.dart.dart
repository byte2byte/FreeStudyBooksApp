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
  var _isLoading = false;
  List<XFile> imagesList = [];
  var book = Book();

  Future<List<String>?> uploadImages(List<XFile> images) async {
    if (images.length < 1) return null;

    List<String> _downloadUrls = [];

    await Future.forEach(images, (image) async {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('published-books')
          .child(currentFirebaseUser!.uid + image.name + 'jpg');

      await ref.putFile(File.File(image.path)).whenComplete(() => null);

      final url = await ref.getDownloadURL();
      _downloadUrls.add(url);
    });
    print('uploaded to storage');
    return _downloadUrls;
  }

  void submitPhotos(
    BuildContext ctx,
    List<XFile> images,
  ) async {
    setState(() {
      _isLoading = true;
    });
    List<String>? urls = await uploadImages(images);
    book.imageUrl = urls!;
    // await FirebaseFirestore.instance.collection('PublishedBooks').add({
    //   'image_urls': urls,
    // });
    setState(() {
      _isLoading = false;
    });
    print('uuploaded url');
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    imagesList.add(pickedImage!);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Image added')));
    print('images addded to list');
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
                    UploadPhoto('Book cover Photo'),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    UploadPhoto('Book title Photo'),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  children: [
                    UploadPhoto('Book pages Photo 1'),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    UploadPhoto('Book pages Photo 2'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.0.h,
            ),
            _isLoading == true
                ? Container(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : BlueBtn(
                    label: "Next",
                    ontap: () {
                      submitPhotos(context, imagesList);
                      Navigator.of(context)
                          .pushNamed(PostBookInfoScreen.routeName, arguments: {
                        'book': book,
                      });
                    })
          ],
        ),
      ),
    );
  }

  Expanded UploadPhoto(String text) {
    return Expanded(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.0.w, vertical: 1.0.h),
          height: 22.0.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(3.0.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Kstyles.subHeadingStyle.copyWith(fontSize: 17.0.sp),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(2.0.w)),
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
    );
  }

  SizedBox kVerticalSpace() {
    return SizedBox(
      height: 2.0.h,
    );
  }
}
