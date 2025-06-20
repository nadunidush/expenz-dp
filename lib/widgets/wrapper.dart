import 'package:expenz_flutter/screens/main_screen.dart';
import 'package:expenz_flutter/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool isMainScreen;
  const Wrapper({super.key, required this.isMainScreen});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.isMainScreen ? MainScreen() : OnboardingScreens();
  }
}
