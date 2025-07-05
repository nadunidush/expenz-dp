import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/data/line_chart_data.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:expenz_flutter/services/user_data_services.dart';
import 'package:expenz_flutter/widgets/home_page_widgets/line_sample_chart.dart';
import 'package:expenz_flutter/widgets/transaction_page_widgets/expense_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:expenz_flutter/widgets/home_page_widgets/home_header_card.dart';

class HomePage extends StatefulWidget {
  final List<ExpenseModel> expensesList;
  final List<IncomeModel> incomeList;
  const HomePage({
    super.key,
    required this.expensesList,
    required this.incomeList,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  double totalExpenseAmount = 0;
  double totalIncomeAmount = 0;

  LineSampleData data = LineSampleData();
  @override
  void initState() {
    UserDataServices.getUserNameAndEmail().then((value) {
      if (value['username'] != null) {
        setState(() {
          username = value['username']!;
        });
      }
    });
    setState(() {
      for (var i = 0; i < widget.expensesList.length; i++) {
        totalExpenseAmount += widget.expensesList[i].amount;
      }

      for(var i=0; i < widget.incomeList.length; i++){
        totalIncomeAmount += widget.incomeList[i].amount;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderCard(
                username: username,
                expensesList: widget.expensesList,
                incomeList: widget.incomeList,
                totalExpensesAmount: totalExpenseAmount,
                totalIncomesAmount: totalIncomeAmount,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Spend Frequency",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),

                    //Line chart
                    LineSampleChart(),

                    //recent transactions
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transactions",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        //content
                        SizedBox(height: 20),
                        SizedBox(
                          height: widget.expensesList.isNotEmpty ? 300 : 80,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                widget.expensesList.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: widget.expensesList.length,
                                        itemBuilder: (context, index) {
                                          final expense =
                                              widget.expensesList[index];
                                          return ExpenseCard(
                                            title: expense.title,
                                            description: expense.description,
                                            category: expense.categories,
                                            amount: expense.amount,
                                            date: expense.date,
                                            time: expense.time,
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Text(
                                          "No Expenses",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
