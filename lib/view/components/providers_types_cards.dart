import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/screens/lawyers_list_view.dart';

class ProviderTypeCard extends StatelessWidget {
  final String image;
  final String title;
  const ProviderTypeCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LawyerListView(type: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LightAppColors().secondaryColor.withOpacity(.3)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
