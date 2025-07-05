import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 1500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: active ? Colors.blueAccent : Colors.grey,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}
