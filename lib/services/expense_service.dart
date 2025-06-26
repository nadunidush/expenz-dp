import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseService {
  //Expense List
  List<ExpenseModel> expenseList = [];

  //Define the key for storing expense in shared preferences.
  static const String _expenseKey = "expense";

  //Save the expense to shared preferences.
  Future<void> saveExpense(ExpenseModel expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? exsistingExpense = prefs.getStringList(_expenseKey);

      //Convert exsisting expense to a list of Expense Object.
      List<ExpenseModel> exsistingExpenseObject = [];
      if (exsistingExpense != null) {
        exsistingExpenseObject = exsistingExpense
            .map((e) => ExpenseModel.fromJson(json.decode(e)))
            .toList();
      }

      //Add the new expense to the exsistingExpenseObject List
      exsistingExpenseObject.add(expense);

      //Convert list of Expense object back to the list of string.
      List<String> updatedExpenses = exsistingExpenseObject
          .map((e) => json.encode(e.toJson()))
          .toList();

      //Save the updated expense to the shared preferences.
      await prefs.setStringList(_expenseKey, updatedExpenses);

      //show the result from snackbar
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Expense added successfully:)")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error of added expense!!!")));
    }
  }

  //Load the expenses from shared preferences
  Future<List<ExpenseModel>> loadExpenses() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    List<String>? exsistingExpense = prefes.getStringList(_expenseKey);

    List<ExpenseModel> loadExpense = [];
    if (exsistingExpense != null) {
      loadExpense = exsistingExpense
          .map((e) => ExpenseModel.fromJson(json.decode(e)))
          .toList();
    }

    return loadExpense;
  }
}
