import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/components/top_lawyers_card.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => FutureBuilder(
        future:
            value.fetchUserDetails(FirebaseAuth.instance.currentUser!.email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            var user = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Hey " + user['name'],
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: LightAppColors().seedColor,
                          ),
                          hintText: 'Search',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(
                                color: LightAppColors().seedColor, width: 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: LightAppColors().seedColor, width: 0.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'What are you looking for?',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors().secondaryColor),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors().secondaryColor),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors().secondaryColor),
                            ),
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors().secondaryColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Top lawyers',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            TopLawyerCard(
                              name: 'Rohit Baing',
                              image: 'assets/Images/lawyer2.png',
                            ),
                            TopLawyerCard(
                              name: 'Sneha Dubey',
                              image: 'assets/Images/lawyer1.png',
                            ),
                            TopLawyerCard(
                              name: 'Rohit Baing',
                              image: 'assets/Images/lawyer2.png',
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Top assistant lawyers',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            TopLawyerCard(
                              name: 'Rohit',
                              image: 'assets/Images/lawyer1.png',
                            ),
                            TopLawyerCard(
                              name: 'Keyur',
                              image: 'assets/Images/lawyer2.png',
                            ),
                            TopLawyerCard(
                              name: 'Sneha Dubey',
                              image: 'assets/Images/lawyer1.png',
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
