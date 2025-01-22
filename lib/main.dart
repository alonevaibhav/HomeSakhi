import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'View/WelcomePage/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Sakhi',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
