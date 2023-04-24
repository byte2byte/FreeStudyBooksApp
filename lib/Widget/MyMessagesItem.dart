import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class MyMessagesItem extends StatelessWidget {
  final String name;
  final String text;
  // final DateTime date;
  final String id;
  final DateTime date;

  MyMessagesItem(this.name, this.text, this.date, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.3.h),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30.w,
                  child: Text(
                    '${name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  DateFormat.yMEd().format(date),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            subtitle: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            // trailing: Text('2/2/2023'),
          )),
    );
  }
}
