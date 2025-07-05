import 'package:flutter/material.dart';

class CustomeTitleAboveTextField extends StatelessWidget {
  const CustomeTitleAboveTextField({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}
