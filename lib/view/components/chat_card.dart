import 'package:flutter/material.dart';
import 'package:nyayak/model/lawyer_model.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/screens/chat/chat_view.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class ChatCard extends StatelessWidget {
  final LawyerModel user;

  const ChatCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    String createChatRoom(String user1, String user2) {
      if (user1[0].toLowerCase().codeUnits[0] >
          user2[0].toLowerCase().codeUnits[0]) {
        return "$user1$user2";
      } else {
        return "$user2$user1";
      }
    }

    return Consumer<HomeViewModel>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          String chatRoomId = createChatRoom(value.userData['id'], user.id);
          print(chatRoomId);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatView(
                        chatRoomId: chatRoomId,
                        lawyer: user,
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
                        user.name,
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
      ),
    );
  }
}
