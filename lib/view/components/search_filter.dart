import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  final String title;
  const SearchFilter({super.key, required this.title});

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
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
