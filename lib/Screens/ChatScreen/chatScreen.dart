import 'package:flutter/material.dart';

import '../../Widget/Messages.dart';
import '../../Widget/NewMessage.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var userId = '';
  var Publisher = '';
  bool check = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (check == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      if (routeArgs != null) {
        userId = routeArgs['userId']!.toString();
        Publisher = routeArgs['Publisher']!.toString();
      }
      check = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        softWrap: true,
        'You are chatting with $Publisher',
        overflow: TextOverflow.fade,
      )),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(userId),
            ),
            NewMessages(userId, Publisher),
          ],
        ),
      ),
    );
  }
}
