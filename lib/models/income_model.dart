import 'package:flutter/material.dart';
import 'package:expenz_flutter/constants/colors.dart';

//categories
enum IncomeCategories { salary, freelance, passiveIncome, sales }

//categories all images
final Map<IncomeCategories, String> incomeCategoryImages = {
  IncomeCategories.salary: "assets/images/salary.png",
  IncomeCategories.freelance: "assets/images/freelance.png",
  IncomeCategories.passiveIncome: "assets/images/income.png",
  IncomeCategories.sales: "assets/images/onboard_1.png",
};

//categories all colors
final Map<IncomeCategories, Color> incomeCategoryColors = {
  IncomeCategories.salary: greenColor,
  IncomeCategories.freelance: Colors.orangeAccent,
  IncomeCategories.passiveIncome: blackColor,
  IncomeCategories.sales: Colors.tealAccent,
};

//Model of Income
class IncomeModel {
  final String id;
  final String title;
  final String description;
  final double amount;
  final IncomeCategories categories;
  final DateTime date;
  final DateTime time;

  IncomeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.categories,
    required this.date,
    required this.time,
  });
}
