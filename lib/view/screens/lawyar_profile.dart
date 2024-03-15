import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';

class LawyerProfile extends StatefulWidget {
  const LawyerProfile({super.key});

  @override
  State<LawyerProfile> createState() => _LawyerProfileState();
}

class _LawyerProfileState extends State<LawyerProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: LightAppColors().backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              router.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 138,
                width: 146,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    'assets/Images/profilelawyer.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Kapil Sibal',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 19,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Delhi, India',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        30.0), // Adjust the horizontal padding as needed
                child: Divider(
                  color: Color(0xFF3B495A),
                  thickness: 2,
                  height: 20, // Adjust the height of the divider as needed
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B495A),
                    width: 1.4,
                  ),
                ),
                height: 80,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cases Solved',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                          Text(
                            '724',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Experience',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                          Text(
                            '12 Years',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Ratings',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                          Text(
                            'Ratings',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B495A),
                    width: 1.4,
                  ),
                ),
                height: 150,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 250, 0),
                      child: Text(
                        'Insights',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        '"I believe in providing clients with clear, practical legal solutions tailored to their unique needs. My approach is client-centric, focusing on achieving the best possible outcome while minimizing stress and uncertainty."',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF514A4A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF3B495A),
                    width: 1.4,
                  ),
                ),
                height: 150,
                width: double.infinity,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 200, 0),
                      child: Text(
                        'Practice Areas',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 130, 2),
                      child: Text(
                        '• Criminal Law \n• Civil Litigation \n• Family Law \n• Real Estate Law \n• Estate Planning and Probate',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF514A4A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
