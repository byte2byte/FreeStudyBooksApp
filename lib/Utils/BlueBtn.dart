import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Kolors.dart';

class BlueBtn extends StatelessWidget {
  Function ontap;
  String label;
  BlueBtn({super.key, required this.label, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: SizedBox(
        height: 5.0.h,
        width: 100.0.w,
        child: Stack(
          children: [
            Positioned(
              left: 1.7.w,
              bottom: 2.h,
              child: Container(
                height: 7.h,
                width: 88.0.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0.w),
                    color: Colors.transparent,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 3),
                          spreadRadius: 3,
                          blurRadius: 0)
                    ]),
              ),
            ),
            Container(
              height: 8.0.h,
              width: 100.0.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0.w),
                color: Kolors.primaryBlue,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
