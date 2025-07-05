import 'package:flutter/material.dart';

class CustomGreySubTitle extends StatelessWidget {
  const CustomGreySubTitle({super.key, required this.subtitle});
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600),
    );
  }
}
