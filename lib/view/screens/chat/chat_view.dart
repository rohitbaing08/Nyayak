import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/model/lawyer_model.dart';
import 'package:nyayak/view/components/chat_bubble.dart';
import 'package:nyayak/view/components/textfield.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  final LawyerModel lawyer;
  final String chatRoomId;
  const ChatView({super.key, required this.lawyer, required this.chatRoomId});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    void onSendMessage(String sendBy) async {
      if (messageController.text.isNotEmpty) {
        Map<String, dynamic> message = {
          'sendBy': sendBy,
          'message': messageController.text,
          'time': Timestamp.now()
        };

        await FirebaseFirestore.instance
            .collection('chatroom')
            .doc(widget.chatRoomId)
            .collection('chats')
            .add(message);
        print('Successfully sent');
        messageController.clear();
      } else {
        print('Something went wrong');
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          widget.lawyer.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('chatroom')
                              .doc(widget.chatRoomId)
                              .collection('chats')
                              .orderBy('time', descending: false)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              print(snapshot.data!.docs);
                              return Expanded(
                                  child: Column(
                                children: [
                                  ...List.generate(
                                      snapshot.data!.docs.length,
                                      (index) => ChatBubble(
                                          message: snapshot.data!.docs[index]
                                              ['message'],
                                          time:
                                              '${snapshot.data!.docs[index]['time'].toDate().hour.toString().padLeft(2, '0')}:${snapshot.data!.docs[index]['time'].toDate().minute.toString().padLeft(2, '0')}',
                                          sender: snapshot.data!.docs[index]
                                                  ['sendBy'] ==
                                              value.userData['name']))
                                ],
                              ));
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: CustomTextfield(
                                  label: 'Enter message...',
                                  hintText: '',
                                  controller: messageController),
                            ),
                            IconButton(
                                onPressed: () {
                                  onSendMessage(value.userData['name']);
                                },
                                icon: const Icon(
                                  Icons.send,
                                  size: 40,
                                ))
                          ],
                        ),
                      ),
                    ),
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
