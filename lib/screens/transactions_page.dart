import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:expenz_flutter/widgets/transaction_page_widgets/expense_card.dart';
import 'package:expenz_flutter/widgets/transaction_page_widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  final List<ExpenseModel> expenseList;
  final List<IncomeModel> incomeList;
  final void Function(ExpenseModel) removeExpense;
  final void Function(IncomeModel) removeIncome;
  const TransactionsPage({
    super.key,
    required this.expenseList,
    required this.removeExpense,
    required this.incomeList,
    required this.removeIncome,
  });

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "See your financial report",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: mainColor,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Expenses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.expenseList.length,
                          itemBuilder: (context, index) {
                            final expense = widget.expenseList[index];
                            return Dismissible(
                              key: ValueKey(expense),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                setState(() {
                                  widget.removeExpense(expense);
                                });
                              },
                              child: ExpenseCard(
                                title: expense.title,
                                description: expense.description,
                                category: expense.categories,
                                amount: expense.amount,
                                date: expense.date,
                                time: expense.time,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Incomes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.incomeList.length,
                          itemBuilder: (context, index) {
                            final income = widget.incomeList[index];
                            return Dismissible(
                              key: ValueKey(income),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                setState(() {
                                  widget.removeIncome(income);
                                });
                              },
                              child: IncomeCard(
                                title: income.title,
                                description: income.description,
                                amount: income.amount,
                                category: income.categories,
                                time: income.time,
                              ),
                            );
                          },
                        ),
                      ],
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
