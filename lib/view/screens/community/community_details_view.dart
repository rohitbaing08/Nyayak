import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';

class CommunityDetails extends StatelessWidget {
  final String category;
  final String description;
  final String title;
  const CommunityDetails(
      {super.key,
      required this.category,
      required this.description,
      required this.title});

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
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(description),
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
