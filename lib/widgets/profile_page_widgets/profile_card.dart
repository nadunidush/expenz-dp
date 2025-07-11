import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  const ProfileCard({super.key, required this.title, required this.icon, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.10),
            offset: Offset(1, 2),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.20),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: bgColor, size: 30),
          ),
          SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
