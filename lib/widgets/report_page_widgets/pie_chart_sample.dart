import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatefulWidget {
  final Map<ExpenseCategories, double> expenseCategoryTotals;
  final Map<IncomeCategories, double> incomeCategoryTotals;
  final bool isExpense;
  final double totalAmount;
  const PieChartSample({
    super.key,
    required this.expenseCategoryTotals,
    required this.incomeCategoryTotals,
    required this.isExpense,
    required this.totalAmount,
  });

  @override
  State<PieChartSample> createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  List<PieChartSectionData> getChart() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expensesCategoryColors[ExpenseCategories.food],
          value: widget.expenseCategoryTotals[ExpenseCategories.food] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensesCategoryColors[ExpenseCategories.health],
          value: widget.expenseCategoryTotals[ExpenseCategories.health] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensesCategoryColors[ExpenseCategories.shopping],
          value: widget.expenseCategoryTotals[ExpenseCategories.shopping] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensesCategoryColors[ExpenseCategories.subscriptions],
          value:
              widget.expenseCategoryTotals[ExpenseCategories.subscriptions] ??
              0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensesCategoryColors[ExpenseCategories.transpotation],
          value:
              widget.expenseCategoryTotals[ExpenseCategories.transpotation] ??
              0,
          showTitle: false,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.freelance],
          value: widget.incomeCategoryTotals[IncomeCategories.freelance] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.passiveIncome],
          value:
              widget.incomeCategoryTotals[IncomeCategories.passiveIncome] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.salary],
          value: widget.incomeCategoryTotals[IncomeCategories.salary] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.sales],
          value: widget.incomeCategoryTotals[IncomeCategories.sales] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: getChart(),
              centerSpaceRadius: 60,
              sectionsSpace: 0,
            ),
          ),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.totalAmount}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
