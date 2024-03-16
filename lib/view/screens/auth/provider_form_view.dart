import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/components/button.dart';
import 'package:nyayak/view/components/dropdown.dart';
import 'package:nyayak/view/components/textfield.dart';
import 'package:nyayak/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class ProviderFormView extends StatelessWidget {
  const ProviderFormView({super.key});

  @override
  Widget build(BuildContext context) {
    String? provider;
    TextEditingController experienceController = TextEditingController();
    String? location;
    TextEditingController licenseController = TextEditingController();
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
              CustomDropdown(
                  label: 'Provider type',
                  ontap: (value) {
                    provider = value;
                  },
                  selected: provider,
                  items: const [
                    'Advocate',
                    'Notary',
                    'Mediator',
                    'Document writer',
                    'Arbitrator'
                  ]),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'Experience',
                hintText: 'Enter experience in years',
                controller: experienceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDropdown(
                  label: 'Location',
                  ontap: (value) {
                    location = value;
                  },
                  selected: location,
                  items: const [
                    'Maharashtra',
                    'Delhi',
                    'Goa',
                    'Karnataka',
                    'Gujrat'
                  ]),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                label: 'License number',
                hintText: '',
                controller: licenseController,
              ),
              const SizedBox(
                height: 35,
              ),
              Consumer<AuthViewModel>(
                builder: (context, value, child) => value.registerLawyerFlag
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
                          value.registerLawyer(
                              value.lawyer.email,
                              value.lawyer.password,
                              value.lawyer.name,
                              value.lawyer.gender,
                              value.lawyer.DOB,
                              value.lawyer.contact,
                              provider!,
                              experienceController.text,
                              location!,
                              licenseController.text);
                        },
                        text: "Sign Up"),
              ),
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
