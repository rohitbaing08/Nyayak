import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function ontap;

  final String text;
  const Button({super.key, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(59, 73, 90, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
