import 'package:flutter/material.dart';
import 'package:expenz_flutter/constants/colors.dart';

//expense categories
enum ExpenseCategories { shopping, subscriptions, food, health, transpotation }

//categories images
final Map<ExpenseCategories, String> expensesCategoryImages = {
  ExpenseCategories.shopping: "assets/images/shopping.png",
  ExpenseCategories.subscriptions: "assets/images/subscribtions.png",
  ExpenseCategories.food: "assets/images/restaurant.png",
  ExpenseCategories.health: "assets/images/health.png",
  ExpenseCategories.transpotation: "assets/images/transportation.png",
};

//categories colors
final Map<ExpenseCategories, Color> expensesCategoryColors = {
  ExpenseCategories.shopping: yellowColor,
  ExpenseCategories.subscriptions: Colors.deepPurpleAccent,
  ExpenseCategories.food: Colors.red,
  ExpenseCategories.health: Colors.indigo,
  ExpenseCategories.transpotation: Colors.blueAccent,
};

class ExpenseModel {
  final int id;
  final String title;
  final String description;
  final double amount;
  final ExpenseCategories categories;
  final DateTime date;
  final DateTime time;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.categories,
    required this.date,
    required this.time,
  });

  //Expense object conver to the JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'amount': amount,
      'category': categories.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
    };
  }

  //JSON conver to the dart object(expense)
  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      amount: json['amount'],
      categories: ExpenseCategories.values[json['category']],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
    );
  }
}
