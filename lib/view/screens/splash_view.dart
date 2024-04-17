import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn().then(
      (value) {
        Timer(const Duration(seconds: 2), () {
          value ? router.go('/') : router.go('/initial-auth');
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(215, 217, 220, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Images/splash.png'),
            const Text(
              'NYAYAK',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
