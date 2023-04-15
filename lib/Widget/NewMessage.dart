import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessages extends StatefulWidget {
  String userId;
  NewMessages(this.userId);

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  var _enteredMessage = '';
  var _controller = new TextEditingController();

  void _SendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance
        .collection('chat')
        .doc('${widget.userId}${user.uid}')
        .collection('PersonalChat')
        .add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'userName': userData['userFirstName'] + ' ' + userData['userLastName'],
      // 'userImage': userData['image_url'],
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
