import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:free_study_books_app/Screens/postYourBookScreen/postBookInfoScreen.dart';
import 'package:free_study_books_app/Utils/BlueBtn.dart';
import 'package:free_study_books_app/Utils/KStyles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostBookPhotosScreen extends StatefulWidget {
  static const routeName = '/post-book-photos-screen';

  @override
  State<PostBookPhotosScreen> createState() => _PostBookPhotosScreenState();
}

class _PostBookPhotosScreenState extends State<PostBookPhotosScreen> {
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
                            "Book cover photo",
                            style: Kstyles.subHeadingStyle
                                .copyWith(fontSize: 17.0.sp),
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
                    )),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
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
                            "Book title photo",
                            style: Kstyles.subHeadingStyle
                                .copyWith(fontSize: 17.0.sp),
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
                    )),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  children: [
                    Expanded(
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
                            "Book pages photo 1",
                            style: Kstyles.subHeadingStyle
                                .copyWith(fontSize: 17.0.sp),
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
                    )),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
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
                            "Book pages photo 2",
                            style: Kstyles.subHeadingStyle
                                .copyWith(fontSize: 17.0.sp),
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
                    )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.0.h,
            ),
            BlueBtn(
                label: "Next",
                ontap: () {
                  Navigator.of(context).pushNamed(PostBookInfoScreen.routeName);
                })
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
