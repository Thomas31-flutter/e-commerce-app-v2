import 'package:ecommercev2app/core/notifier/theme_notifier.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListTile(
          title: Text(
            "Dark Theme",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          trailing: ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, currentTheme, child) {
              return Switch(
                value: currentTheme == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.value = value
                      ? ThemeMode.dark
                      : ThemeMode.light;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
