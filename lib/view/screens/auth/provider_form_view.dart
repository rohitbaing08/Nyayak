import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/textfield.dart';

class ProviderFormView extends StatelessWidget {
  const ProviderFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Professional Details',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(label: 'Type of Provider', hintText: ''),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'Professionalities',
                hintText: '',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: "Location",
                hintText: '',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(label: 'License number', hintText: ''),
              const SizedBox(
                height: 35,
              ),
              Button(ontap: () {}, text: "Sign Up"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
