import 'dart:convert';

import 'package:expenz_flutter/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  List<IncomeModel> incomeList = [];

  //create key for storing income in the shared preferences
  static const String _incomeKey = "income";

  //Save the income in shared preferences
  Future<void> saveIncome(IncomeModel income, BuildContext context) async {
    try {
      SharedPreferences prefes = await SharedPreferences.getInstance();
      List<String>? exsistingIncome = prefes.getStringList(_incomeKey);

      List<IncomeModel> exsistingIncomeObject = [];
      if (exsistingIncome != null) {
        exsistingIncomeObject = exsistingIncome
            .map((e) => IncomeModel.fromJson(json.decode(e)))
            .toList();
      }
      exsistingIncomeObject.add(income);

      List<String> updatedIncome = exsistingIncomeObject
          .map((e) => json.encode(e.toJson()))
          .toList();
      await prefes.setStringList(_incomeKey, updatedIncome);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Income Added Successfully")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error in ${e}")));
    }
  }

  //Load the income

  Future<List<IncomeModel>> loadIncomes() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    List<String>? exsistingIncomes = prefes.getStringList(_incomeKey);

    List<IncomeModel> loadIncome = [];
    if (exsistingIncomes != null) {
      loadIncome = exsistingIncomes
          .map((e) => IncomeModel.fromJson(json.decode(e)))
          .toList();
    }

    return loadIncome;
  }

  //remove the Income from shared preferences
  Future<void> removeIncome(int id, BuildContext context) async {
    try {
      SharedPreferences prefes = await SharedPreferences.getInstance();
      List<String>? exsistingIncomes = prefes.getStringList(_incomeKey);

      List<IncomeModel> exsistingIncomeObject = [];
      if (exsistingIncomes != null) {
        exsistingIncomeObject = exsistingIncomes
            .map((e) => IncomeModel.fromJson(json.decode(e)))
            .toList();
      }

      exsistingIncomeObject.removeWhere((income) => income.id == id);

      //convert exsistingIncomeObject to the shared preferences
      List<String>? updatedIncomes = [];
      updatedIncomes = exsistingIncomeObject
          .map((e) => json.encode(e.toJson()))
          .toList();

      await prefes.setStringList(_incomeKey, updatedIncomes);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Remove Income succuessfully")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e}")));
    }
  }
}
