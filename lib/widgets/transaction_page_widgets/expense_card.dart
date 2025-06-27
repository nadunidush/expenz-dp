import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final String description;
  final ExpenseCategories category;
  final double amount;
  final DateTime date;
  final DateTime time;
  const ExpenseCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.amount,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.1),
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: expensesCategoryColors[category]!.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                fit: BoxFit.cover,
                expensesCategoryImages[category]!,
                width: 45,
                color: expensesCategoryColors[category],
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 140,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-\$${amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: redColor,
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
