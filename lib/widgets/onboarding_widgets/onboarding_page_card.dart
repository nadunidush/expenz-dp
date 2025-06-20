import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class OnboardingPageCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingPageCard({super.key, required this.image, required this.title, required this.description});

  @override
  State<OnboardingPageCard> createState() => _OnboardingPageCardState();
}

class _OnboardingPageCardState extends State<OnboardingPageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.image,
            width: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            widget.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: blackColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            widget.description,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
