import 'package:ecommercev2app/features/cart/screens/cart_screen.dart';
import 'package:ecommercev2app/features/favourite/screens/favourite_screen.dart';
import 'package:ecommercev2app/features/home/screens/home_screen.dart';
import 'package:ecommercev2app/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarMainLayout extends StatefulWidget {
  const BottomNavigationBarMainLayout({super.key});

  @override
  State<BottomNavigationBarMainLayout> createState() =>
      _BottomNavigationBarMainLayoutState();
}

class _BottomNavigationBarMainLayoutState
    extends State<BottomNavigationBarMainLayout> {
  int index = 0;
  List screens = [
    HomeScreen(),
    ProfileScreen(),
    CartScreen(),
    FavouriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF37474F)),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 20, color: Colors.blueAccent),
          unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 16),
          showUnselectedLabels: true,
          iconSize: 36,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "cart",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              label: "favourite",
            ),
          ],
        ),
      ),
    );
  }
}
