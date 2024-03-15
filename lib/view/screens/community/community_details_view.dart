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
                const Text(
                  'Property Case',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '''For months, I've been struggling with severe issues in my apartment building. Leaky roofs cause constant dampness, faulty electrical wiring poses a significant safety hazard, and the elevators malfunction frequently.
                The constant dampness has led to mold growth in some areas, further aggravating the situation. The malfunctioning elevators create significant inconvenience, especially for elderly residents or those with mobility limitations.
                Despite raising these concerns with  the building management on multiple occasions, no concrete steps have been taken to address these problems. This situation is not only frustrating but also concerning for the well-being of myself and other tenants.
                Many other tenants have also voiced their complaints to the management, but our concerns seem to be falling on deaf ears. This lack of response is creating a sense of helplessness and frustration among the residents.
                I've explored various avenues to address this issue, but haven't found a satisfactory solution so far. Living in these conditions is simply unacceptable and poses a potential risk to the health and safety of the residents. We urge the building management to take immediate and effective action to rectify these critical issues.
                For months, I've been struggling with severe issues in my apartment building. Leaky roofs cause constant dampness, faulty electrical wiring poses a significant safety hazard, and the elevators malfunction frequently.
                The constant dampness has led to mold growth in some areas, further aggravating the situation. The malfunctioning elevators create significant inconvenience, especially for elderly residents or those with mobility limitations.
                ''',
                  style: TextStyle(fontSize: 14),
                ),
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
