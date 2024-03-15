import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommunityPost extends StatelessWidget {
  const CommunityPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 369,
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
                  child: Icon(Icons.home_filled),
                ),
              ),
              Text(
                'Property Case',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'For months, I have been dealing with terrible living conditions in my apartment building. Leaky roofs cause constant dampness, faulty electrical wiring poses a safety hazard, and the elevators malfunction frequently. I didnt know where to turn or what my rights were as a tenant. Thankfully, I discovered the Nyayak app and...',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Color(0xFF3B495A),
              // Background color of the container
              borderRadius: BorderRadius.circular(
                  20), // Radius value half of the width or height for a perfect circle
              border: Border.all(
                color: Colors.black, // Color of the border
                width: 1, // Width of the border
              ),
            ),
            child: Center(
                child: Text(
              'Read more',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
