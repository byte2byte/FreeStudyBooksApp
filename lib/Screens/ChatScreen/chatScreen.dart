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

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    userId = userId;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('You are chatting with *Author*')),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(userId),
            ),
            NewMessages(userId),
          ],
        ),
      ),
    );
  }
}
