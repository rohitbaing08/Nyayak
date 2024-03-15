import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';

class TopLawyerCard extends StatelessWidget {
  final String image;
  final String name;
  const TopLawyerCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        router.push('/lawyer-profile');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: LightAppColors().secondaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                ),
                Container(
                  width: 140,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(208, 213, 218, .5),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                )
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(name)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
