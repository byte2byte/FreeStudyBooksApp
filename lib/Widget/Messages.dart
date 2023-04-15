// import 'package:firebase_core/firebase_core.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:free_study_books_app/Widget/MessageBubble.dart';
import '../Utils/global.dart';

class Messages extends StatelessWidget {
  String userId;
  Messages(this.userId);

  Future<bool> _getUser(id) async {
    final user = await FirebaseAuth.instance.currentUser;
    return user!.uid == id;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .doc('${userId}${currentFirebaseUser!.uid}')
            .collection('PersonalChat')
            .orderBy(
              'createdAt',
              descending: true,
            )
            .snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final user = FirebaseAuth.instance.currentUser;

          return ListView.builder(
            reverse: true,
            itemCount: snapshot.data?.docs.length,
            itemBuilder: ((context, index) => Column(
                  children: [
                    if (index == snapshot.data!.docs.length - 1)
                      DateChip(
                        date: (snapshot.data!.docs[index]['createdAt']
                                as Timestamp)
                            .toDate(),
                      ),
                    if (index < snapshot.data!.docs.length - 1 &&
                        ((snapshot.data!.docs[index]['createdAt'] as Timestamp)
                                    .toDate()
                                    .day !=
                                (snapshot.data!.docs[index + 1]['createdAt']
                                        as Timestamp)
                                    .toDate()
                                    .day ||
                            (snapshot.data!.docs[index]['createdAt']
                                        as Timestamp)
                                    .toDate()
                                    .month !=
                                (snapshot.data!.docs[index + 1]['createdAt']
                                        as Timestamp)
                                    .toDate()
                                    .month))
                      DateChip(
                        date: (snapshot.data!.docs[index]['createdAt']
                                as Timestamp)
                            .toDate(),
                      ),
                    BubbleSpecialOne(
                      color: user!.uid == snapshot.data!.docs[index]['userId']
                          ? Colors.grey
                          : Color.fromARGB(255, 194, 166, 231),
                      text: snapshot.data!.docs[index]['text'],
                      isSender:
                          user.uid == snapshot.data!.docs[index]['userId'],

                      // snapshot.data!.docs[index]['text'],
                      // user!.uid == snapshot.data!.docs[index]['userId'],

                      // snapshot.data!.docs[index]['userName'],
                      // // snapshot.data!.docs[index]['userImage'],
                      // KEY: ValueKey(snapshot.data!.docs[index].toString()),
                    ),
                  ],
                )),
          );
        }));
  }
}
