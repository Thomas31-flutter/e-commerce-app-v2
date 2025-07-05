import 'package:flutter/material.dart';

class CustomeDiscountCardPageview extends StatelessWidget {
  const CustomeDiscountCardPageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),

        height: 200,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              left: -60,
              bottom: -70,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blueAccent.withAlpha(50),
              ),
            ),
            Positioned(
              right: -50,
              bottom: 0,
              top: 0,
              child: Image.asset(
                "assets/images/undraw_discount_igfl.png",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "24% off shipping today \n on pag burshase",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text("by kutuku store", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
