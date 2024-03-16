import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';

class CommunityDetails extends StatelessWidget {
  const CommunityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Community Voice',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('community')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          print("${snapshot.data!.docs}");
                          return SizedBox(
                            width: double.infinity,
                            height: 600,
                            child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    subtitle: Expanded(
                                      child: Text(
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        "${snapshot.data!.docs[index]["description"]}",
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.hasError.toString()}"),
                          );
                        } else {
                          return Center(
                            child: Text("No Data Found"),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                // const Text("${snapshot.data}"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Facing same issue? ',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(124, 124, 124, 1)),
                        children: [
                          TextSpan(
                            text: 'Share with us',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                router.push('/add-community-posts');
                              },
                            style: TextStyle(
                                fontSize: 18,
                                color: LightAppColors().seedColor),
                          )
                        ]),
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
