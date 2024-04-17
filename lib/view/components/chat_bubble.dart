import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool sender;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.sender,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: sender ? 0 : .5, color: Colors.black),
              color: sender ? LightAppColors().seedColor : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(
                  color: sender ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Text(time)
        ],
      ),
    );
  }
}
