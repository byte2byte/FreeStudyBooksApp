import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:free_study_books_app/Utils/global.dart';

class NewMessages extends StatefulWidget {
  String recieverId;
  String recieverName;
  NewMessages(this.recieverId, this.recieverName);

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  var _enteredMessage = '';
  var _controller = new TextEditingController();

  void _SendMessage() async {
    FocusScope.of(context).unfocus();

    var personalChatId = widget.recieverId + currentFirebaseUser!.uid;
    // print(widget.userId);
    // print(personalChatId);
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentFirebaseUser!.uid)
        .get();
    // FirebaseFirestore.instance
    //     .collection('chat')
    //     .doc('${widget.userId}${currentFirebaseUser!.uid}')
    //     .collection('PersonalChat')
    //     .add({
    //   'text': _enteredMessage,
    //   'createdAt': Timestamp.now(),
    //   'userId': currentFirebaseUser!.uid,
    //   'userName': userData['userFirstName'] + ' ' + userData['userLastName'],
    // });
    await FirebaseFirestore.instance
        .collection("chat")
        .doc(currentFirebaseUser!.uid)
        .collection(widget.recieverId)
        .add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': currentFirebaseUser!.uid,
      'userName': userData['userFirstName'] + ' ' + userData['userLastName'],
    });
    await FirebaseFirestore.instance
        .collection("chat")
        .doc(widget.recieverId)
        .collection(currentFirebaseUser!.uid)
        .add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': currentFirebaseUser!.uid,
      'userName': userData['userFirstName'] + ' ' + userData['userLastName'],
    });
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentFirebaseUser!.uid)
        .collection('recentChat')
        .doc(widget.recieverId)
        .set({
      'ID': widget.recieverId,
      'Name': widget.recieverName,
      'lastText': _enteredMessage,
    });
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.recieverId)
        .collection('recentChat')
        .doc(currentFirebaseUser!.uid)
        .set({
      'ID': currentFirebaseUser!.uid,
      'Name': userData['userFirstName'] + ' ' + userData['userLastName'],
      'lastText': _enteredMessage,
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Message'),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _SendMessage,
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
