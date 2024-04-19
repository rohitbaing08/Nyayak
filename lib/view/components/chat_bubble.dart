import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool sender;
  final String type;
  final BuildContext context;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.sender,
      required this.time,
      required this.type,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return type == 'text'
        ? Container(
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
                    border:
                        Border.all(width: sender ? 0 : .5, color: Colors.black),
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
          )
        : GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                            body: Container(
                              width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                              color: Colors.black,
                              child: message == ''
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Expanded(
                                      child: Center(
                                        child: Image.network(
                                          message,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                            ),
                          )));
            },
            child: Container(
              alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                width: 250,
                height: 350,
                child: message == ''
                    ? const Center(child: CircularProgressIndicator())
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          message,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
              ),
            ),
          );
  }
}
