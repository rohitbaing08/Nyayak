import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'NYAYAK',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Log In an account',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 80,
              ),
              CustomTextfield(
                label: 'Email',
                hintText: 'Enter email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(label: 'Password', hintText: 'Enter password'),
              const SizedBox(
                height: 35,
              ),
              Button(ontap: () {}, text: "Log In"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(124, 124, 124, 1)),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              router.go('/initial-auth');
                            },
                          style: TextStyle(
                              fontSize: 18, color: LightAppColors().seedColor),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
