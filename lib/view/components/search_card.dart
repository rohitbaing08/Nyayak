import 'package:flutter/material.dart';
import 'package:nyayak/model/lawyer_model.dart';
import 'package:nyayak/view/screens/lawyar_profile.dart';

class SearchCard extends StatelessWidget {
  final LawyerModel lawyer;
  const SearchCard({super.key, r, required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LawyerProfile(
                    lawyerName: lawyer.name,
                    experience: lawyer.experience,
                    location: lawyer.location)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF0F2F5),
            border: Border.all(
              color: Colors.black.withOpacity(0.4),
              // Set the color of the border
              width: 2, // Set the width of the border
            ),
          ),
          child: Row(
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 2, 2),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/Images/profilepic.jpeg'),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lawyer.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(lawyer.provider),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
