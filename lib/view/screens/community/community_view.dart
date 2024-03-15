import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('community')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .83,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return CommunityPost(
                              category: snapshot.data!.docs[index]['category'],
                              description: snapshot.data!.docs[index]
                                  ['description'],
                              title: snapshot.data!.docs[index]['subject'],
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
