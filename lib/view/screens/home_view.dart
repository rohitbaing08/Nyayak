import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';
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
                  '${"Hey " + user['name']}👋',
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          router.push('/chat');
                        },
                        icon: const Icon(
                          Icons.message_outlined,
                          color: Colors.black,
                          size: 40,
                        )),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  color: LightAppColors()
                                      .secondaryColor
                                      .withOpacity(.4)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors()
                                      .secondaryColor
                                      .withOpacity(.4)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors()
                                      .secondaryColor
                                      .withOpacity(.4)),
                            ),
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: LightAppColors()
                                      .secondaryColor
                                      .withOpacity(.4)),
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
                      FutureBuilder(
                        future: value.fetchLawyers(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(height: 70);
                          } else {
                            var lawyers = snapshot.data;
                            return SizedBox(
                              height: 70,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  TopLawyerCard(
                                    lawyer: lawyers[0],
                                    image: 'assets/Images/lawyer2.png',
                                  ),
                                  TopLawyerCard(
                                    lawyer: lawyers[1],
                                    image: 'assets/Images/profilepic.jpeg',
                                  ),
                                  TopLawyerCard(
                                    lawyer: lawyers[2],
                                    image: 'assets/Images/profilepic.jpeg',
                                  )
                                ],
                              ),
                            );
                          }
                        },
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
                      FutureBuilder(
                        future: value.fetchLawyers(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(height: 70);
                          } else {
                            var lawyers = snapshot.data;
                            return SizedBox(
                              height: 70,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  TopLawyerCard(
                                    lawyer: lawyers[3],
                                    image: 'assets/Images/lawyer1.png',
                                  ),
                                  TopLawyerCard(
                                    lawyer: lawyers[4],
                                    image: 'assets/Images/profilepic.jpeg',
                                  ),
                                  TopLawyerCard(
                                    lawyer: lawyers[5],
                                    image: 'assets/Images/lawyer2.png',
                                  )
                                ],
                              ),
                            );
                          }
                        },
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
