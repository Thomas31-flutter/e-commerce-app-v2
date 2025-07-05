import 'package:flutter/material.dart';
//
// class CategoryTapScreen extends StatelessWidget {
//   const CategoryTapScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(height: double.infinity, color: Colors.red),
//     );
//   }
// }

class CategoryTapScreen extends StatelessWidget {
  const CategoryTapScreen({super.key});

  final List<String> dummyCategories = const [
    "Smartphones",
    "Laptops",
    "Fragrances",
    "Skincare",
    "Groceries",
    "Home Decoration",
    "Furniture",
    "Lighting",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView.useDelegate(
        clipBehavior: Clip.antiAlias,
        itemExtent: 150,
        perspective: 0.002,
        diameterRatio: 1,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: dummyCategories.length,
          builder: (context, index) {
            final category = dummyCategories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withAlpha(50),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
