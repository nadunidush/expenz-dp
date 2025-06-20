import 'package:flutter/material.dart';
import 'package:expenz_flutter/screens/onboarding_screens.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenze",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Inter"),
      home: OnboardingScreens(),
    );
  }
}
