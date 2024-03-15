import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/textfield.dart';

class ProviderFormView extends StatelessWidget {
  const ProviderFormView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController providerController = TextEditingController();
    TextEditingController professionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController lisenseController = TextEditingController();
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
              CustomTextfield(
                label: 'Type of Provider',
                hintText: '',
                controller: providerController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'Professionalities',
                hintText: '',
                controller: professionController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: "Location",
                hintText: '',
                controller: locationController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'License number',
                hintText: '',
                controller: lisenseController,
              ),
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
