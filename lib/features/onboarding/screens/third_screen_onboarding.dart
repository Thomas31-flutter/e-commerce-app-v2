import 'package:flutter/material.dart';

class ThirdScreenOnboarding extends StatelessWidget {
  const ThirdScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 150),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/undraw_wishlist_0k5w.png",
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
            Text(
              "Make Favourits",
              style: TextStyle(
                fontSize: 42,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
