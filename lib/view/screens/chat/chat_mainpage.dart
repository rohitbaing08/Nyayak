import 'package:flutter/material.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/view/components/chat_card.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class ChatMainView extends StatelessWidget {
  const ChatMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              router.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Messages',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
              future: value.fetchLawyers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Expanded(
                        child: Center(child: CircularProgressIndicator())),
                  );
                } else {
                  List data = snapshot.data
                      .where((user) => user.id != value.userData['id'])
                      .toList();
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ...List.generate(
                          data.length, (index) => ChatCard(user: data[index]))
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
