import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatView extends StatefulWidget {
  final String username;
  const ChatView({super.key, required this.username});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    List<types.Message> messages = [];
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
          widget.username,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chat(
            messages: messages,
            onSendPressed: (a) {},
            user: types.User(id: widget.username),
            theme: DefaultChatTheme(
              inputContainerDecoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
              inputBorderRadius: BorderRadius.circular(20),
              inputBackgroundColor: Colors.white,
              inputTextColor: Colors.black,
              inputTextCursorColor: Colors.black,
              deliveredIcon: const Text(
                'delivered',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
              seenIcon: const Text(
                'read',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            )),
      ),
    );
  }
}
