import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';

class CommunityPost extends StatelessWidget {
  final String category;
  final String description;
  const CommunityPost(
      {super.key, required this.category, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 240,
      decoration: BoxDecoration(
        // Background color of the container
        borderRadius: BorderRadius.circular(
            10), // Radius value half of the width or height for a perfect circle
        border: Border.all(
          color: Colors.black, // Color of the border
          width: 1, // Width of the border
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              category,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 2),
          InkWell(
            onTap: () {
              router.push('/community-details');
            },
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: LightAppColors().seedColor,
                // Background color of the container
                borderRadius: BorderRadius.circular(
                    20), // Radius value half of the width or height for a perfect circle
              ),
              child: const Center(
                  child: Text(
                'Read more',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
