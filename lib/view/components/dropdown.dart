import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final Function ontap;
  final String? selected;
  final List<String> items;
  const CustomDropdown(
      {super.key,
      required this.label,
      required this.ontap,
      required this.selected,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selected,
      items: items
          .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
          .toList(),
      onChanged: (value) {
        ontap(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: LightAppColors().seedColor, width: 0.5),
        ),
        labelText: label,
      ),
    );
  }
}
