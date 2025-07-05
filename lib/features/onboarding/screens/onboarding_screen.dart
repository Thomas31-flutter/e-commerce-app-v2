import 'package:ecommercev2app/features/login/screens/login_screen.dart';
import 'package:ecommercev2app/features/onboarding/screens/first_screen_onboarding.dart';
import 'package:ecommercev2app/features/onboarding/screens/second_screen_onboarding.dart';
import 'package:ecommercev2app/features/onboarding/screens/third_screen_onboarding.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: pageController,
                children: [
                  FirstScreenOnboarding(),
                  SecondScreenOnboarding(),
                  ThirdScreenOnboarding(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: index == 0),
                SizedBox(width: 10),
                CustomIndicator(active: index == 1),
                SizedBox(width: 10),
                CustomIndicator(active: index == 2),
              ],
            ),
            // SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(44),
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Already have an account",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
