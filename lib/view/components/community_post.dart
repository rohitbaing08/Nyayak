import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/screens/community/community_details_view.dart';

class CommunityPost extends StatelessWidget {
  final String category;
  final String description;
  final String title;
  const CommunityPost(
      {super.key,
      required this.category,
      required this.description,
      required this.title});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                category,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Text(
                    description,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityDetails(
                                description: description,
                                category: category,
                                title: title,
                              )));
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
        ),
      ),
    );
  }
}
