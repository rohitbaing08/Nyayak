import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/dropdown.dart';
import 'package:nyayak/view/components/textfield.dart';
import 'package:nyayak/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  String? isClient;
  RegisterView({super.key, this.isClient = 'client'});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    String? gender;
    TextEditingController DOBController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: LightAppColors().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
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
                      child: CustomDropdown(
                          label: 'Gender',
                          ontap: (value) {
                            gender = value;
                          },
                          selected: gender,
                          items: const ['Male', 'Female', 'Others']),
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
                obsecureText: true,
                label: 'Password',
                hintText: 'Enter password',
                controller: passwordController,
              ),
              const SizedBox(
                height: 35,
              ),
              Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return widget.isClient == 'client'
                      ? value.registerClientFlag
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
                                value.registerClient(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    gender!,
                                    DOBController.text,
                                    contactController.text);
                              },
                              text: "Sign Up")
                      : Consumer<AuthViewModel>(
                          builder: (context, value, child) => Button(
                              ontap: () {
                                value.intermidiateData(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    gender!,
                                    DOBController.text,
                                    contactController.text);
                                router.push('/lawyer-form');
                              },
                              text: "Next"),
                        );
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
