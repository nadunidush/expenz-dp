import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  const CustomButton({super.key, required this.title, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            fontSize: 18,
            color: whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
