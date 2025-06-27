import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String description;
  final double amount;
  final IncomeCategories category;
  final DateTime time;
  const IncomeCard({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.20),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: whiteColor,
            blurRadius: 2,
            offset: Offset(2, 4),
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: incomeCategoryColors[category]?.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                incomeCategoryImages[category]!,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 100,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+\$${amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: greenColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                DateFormat.jm().format(time),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: greyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
