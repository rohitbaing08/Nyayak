import 'package:flutter/material.dart';
import 'package:nyayak/view/components/community_post.dart';

class CommunityPostView extends StatelessWidget {
  const CommunityPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Community Voice',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [CommunityPost(), CommunityPost()],
          ),
        ),
      ),
    );
  }
}
