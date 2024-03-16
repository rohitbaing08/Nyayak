import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/screens/chat/chat_view.dart';

class ChatCard extends StatelessWidget {
  final String name;

  const ChatCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatView(
                      username: name,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LightAppColors().secondaryColor.withOpacity(.1),
          ),
          child: Row(
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 2, 2),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/Images/profilepic.jpeg'),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
