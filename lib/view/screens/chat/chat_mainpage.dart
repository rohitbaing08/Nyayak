import 'package:flutter/material.dart';
import 'package:nyayak/view/components/chat_card.dart';

class ChatMainView extends StatelessWidget {
  const ChatMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Messages',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ChatCard(name: 'Keyur chaudhari'),
              ChatCard(name: 'Jay ghodvinde'),
              ChatCard(name: 'Rohit gupta'),
              ChatCard(name: 'Harsh shukla'),
              ChatCard(name: 'Sneha dubey'),
              ChatCard(name: 'Siddharth jadhav'),
              ChatCard(name: 'Daji Adelkar')
            ],
          ),
        ),
      ),
    );
  }
}
