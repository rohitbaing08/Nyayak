import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';

class CommunityPost extends StatelessWidget {
  const CommunityPost({super.key});

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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    // Background color of the container
                    borderRadius: BorderRadius.circular(
                        100), // Radius value half of the width or height for a perfect circle
                    border: Border.all(
                      color: Colors.black, // Color of the border
                      width: 1, // Width of the border
                    ),
                  ),
                  child: const Icon(Icons.home_filled),
                ),
              ),
              const Text(
                'Property Case',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'For months, I have been dealing with terrible living conditions in my apartment building. Leaky roofs cause constant dampness, faulty electrical wiring poses a safety hazard, and the elevators malfunction frequently. I didnt know where to turn or what my rights were as a tenant. Thankfully, I discovered the Nyayak app and...',
              style: TextStyle(
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
