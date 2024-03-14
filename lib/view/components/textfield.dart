import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';

class CustomTextfield extends StatelessWidget {
  TextInputType keyboardType;
  final String label;
  final String hintText;
  CustomTextfield(
      {super.key,
      this.keyboardType = TextInputType.text,
      required this.label,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
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
