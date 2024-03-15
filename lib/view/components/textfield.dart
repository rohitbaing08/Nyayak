import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  TextInputType keyboardType;
  bool obsecureText;
  final String label;
  final String hintText;
  CustomTextfield(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.obsecureText = false,
      required this.label,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: LightAppColors().seedColor, width: 0.5),
        ),
      ),
    );
  }
}
