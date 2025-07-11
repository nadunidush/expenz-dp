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

  //delete the expense from shared preferences
  Future<void> removeExpense(int id, BuildContext context) async {
    try {
      SharedPreferences prefes = await SharedPreferences.getInstance();
      List<String>? exsistingExpenses = prefes.getStringList(_expenseKey);

      //conver dart object for exsistingExpenses in shared preferences
      List<ExpenseModel> exsistingExpenseObject = [];
      if (exsistingExpenses != null) {
        exsistingExpenseObject = exsistingExpenses
            .map((e) => ExpenseModel.fromJson(json.decode(e)))
            .toList();
      }

      //delete the specific expense from dart object (id)
      exsistingExpenseObject.removeWhere((expense) => expense.id == id);

      //convert exsistingExpenseObject to save Shared Preferences
      List<String>? updatedExpenseList = exsistingExpenseObject
          .map((e) => json.encode(e.toJson()))
          .toList();
      await prefes.setStringList(_expenseKey, updatedExpenseList);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Remove Expense succuessfully")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  //delete all expenses
  Future<void> deleteAllExpenses(BuildContext context) async {
    try {
      SharedPreferences prefes = await SharedPreferences.getInstance();
      await prefes.remove(_expenseKey);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Delete Expense succuessfully")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error Deleting Expense")));
    }
  }
}
