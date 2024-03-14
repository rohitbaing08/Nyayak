import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(215, 217, 220, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'N',
              style: TextStyle(fontSize: 120),
            ),
            Text(
              'NYAYAK',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
