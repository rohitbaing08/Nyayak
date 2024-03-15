import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/model/user_model.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/textfield.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController DOBController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: LightAppColors().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'NYAYAK',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Create an account',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                label: 'Full name',
                hintText: 'Enter full name',
                controller: nameController,
              ),
              const SizedBox(
                height: 15,
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
                controller: contactController,
                label: "Contact",
                hintText: 'Enter contact',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CustomTextfield(
                        label: "Gender",
                        hintText: 'Enter gender',
                        controller: genderController,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CustomTextfield(
                          label: 'DOB',
                          hintText: 'Enter DOB',
                          controller: DOBController,
                        )),
                  )
                ],
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
              Button(
                  ontap: () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        UserModel dataToSave = UserModel(
                            id: value.user!.uid,
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            gender: genderController.text,
                            DOB: DOBController.text,
                            contact: contactController.text);
                        FirebaseFirestore.instance
                            .collection('user')
                            .add(dataToSave.toJson())
                            .then((value) => router.go('/'));
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  text: "Sign Up"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(124, 124, 124, 1)),
                      children: [
                        TextSpan(
                          text: 'Log In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              router.go('/login');
                            },
                          style: TextStyle(
                              fontSize: 18, color: LightAppColors().seedColor),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
