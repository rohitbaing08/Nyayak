import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/textfield.dart';
import 'package:nyayak/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: LightAppColors().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
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
                controller: emailController,
                label: 'Email',
                hintText: 'Enter email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'Password',
                hintText: 'Enter password',
                controller: passwordController,
              ),
              const SizedBox(
                height: 35,
              ),
              Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return value.loginFlag
                      ? Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(59, 73, 90, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                        )
                      : Button(
                          ontap: () {
                            value.login(
                                emailController.text, passwordController.text);
                          },
                          text: "Log In");
                },
              ),
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
