import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", width: 150, fit: BoxFit.cover),
        Text(
          "Expenz",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: mainColor,
          ),
        ),
      ],
    );
  }
}
