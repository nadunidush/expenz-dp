import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:expenz_flutter/widgets/report_page_widgets/category_item.dart';
import 'package:expenz_flutter/widgets/report_page_widgets/pie_chart_sample.dart';
import 'package:expenz_flutter/widgets/report_page_widgets/row_item.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  final Map<ExpenseCategories, double> expenseCategoryTotals;
  final Map<IncomeCategories, double> incomeCategoryTotals;
  const ReportPage({
    super.key,
    required this.expenseCategoryTotals,
    required this.incomeCategoryTotals,
  });

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int _selectedIndex = 0;

  //get the caegory color Income or Expense
  Color getCategoryColor(dynamic category) {
    if (category is ExpenseCategories) {
      return expensesCategoryColors[category]!;
    } else {
      return incomeCategoryColors[category]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _selectedIndex == 0
        ? widget.expenseCategoryTotals
        : widget.incomeCategoryTotals;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Financial Report",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),

                //select expense or incomes
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 0
                                ? redColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                fontSize: 18,
                                color: _selectedIndex == 0
                                    ? whiteColor
                                    : blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 1
                                ? greenColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 18,
                                color: _selectedIndex == 1
                                    ? whiteColor
                                    : blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Pie chart
                SizedBox(height: 30),
                PieChartSample(
                  expenseCategoryTotals: widget.expenseCategoryTotals,
                  incomeCategoryTotals: widget.incomeCategoryTotals,
                  isExpense: _selectedIndex == 0,
                  totalAmount: _selectedIndex == 0
                      ? widget.expenseCategoryTotals.values.reduce(
                          (value, element) => value + element,
                        )
                      : widget.incomeCategoryTotals.values.reduce(
                          (value, element) => value + element,
                        ),
                ),

                //Row category
                SizedBox(height: 20),
                RowItem(),

                //All Categories in progressIndicator
                SizedBox(height: 40),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final category = data.keys.toList()[index];
                        final amount = data.values.toList()[index];
                        return CategoryItem(
                          title: category.name,
                          amount: amount,
                          categoryColor: getCategoryColor(category),
                          total: data.values.reduce(
                            (value, element) => value + element,
                          ),
                          isExpense: _selectedIndex == 0,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
