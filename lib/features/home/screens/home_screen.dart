import 'package:ecommercev2app/features/home/screens/category_tap_screen.dart';
import 'package:ecommercev2app/features/home/screens/home_tap_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_listtile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomeListTile(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.blueAccent,
                  indicatorWeight: 5,
                  labelStyle: TextStyle(fontSize: 22),

                  tabs: [
                    Tab(text: "Home"),
                    Tab(text: "Category"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [HomeTapScreen(), CategoryTapScreen()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
