import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String msg;
  final bool isMe;
  final String UserNAme;
  // final String UserImageUrl;
  Key KEY;
  MessageBubble(
    this.msg,
    this.isMe,
    this.UserNAme,
    // this.UserImageUrl,
    {
    required this.KEY,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  topLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                  topRight: !isMe ? Radius.circular(12) : Radius.circular(12),
                  bottomLeft: !isMe ? Radius.circular(12) : Radius.circular(12),
                  bottomRight: !isMe ? Radius.circular(12) : Radius.circular(0),
                ),
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    isMe ? 'You' : UserNAme,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe ? Colors.black : Colors.white,
                    ),
                  ),
                  Text(
                    msg,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        // Positioned(
        //   top: -10,
        //   left: isMe ? null : 130,
        //   right: isMe ? 130 : null,
        //   child: CircleAvatar(
        //     backgroundImage: NetworkImage(UserImageUrl),
        //   ),
        // ),
      ],
    );
  }
}
