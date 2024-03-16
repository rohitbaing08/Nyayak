import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  final List<String> items;
  final String? selected;
  final String title;
  final Function ontap;
  const SearchFilter(
      {super.key,
      required this.title,
      required this.items,
      required this.selected,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF3B495A),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: DropdownButtonFormField<String>(
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
              elevation: 0,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
