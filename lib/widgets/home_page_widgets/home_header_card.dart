import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:expenz_flutter/widgets/home_page_widgets/income_expense_small_card.dart';
import 'package:flutter/material.dart';

class HomeHeaderCard extends StatefulWidget {
  final List<ExpenseModel> expensesList;
  final List<IncomeModel> incomeList;
  final double totalExpensesAmount;
  final double totalIncomesAmount;
  final String username;
  const HomeHeaderCard({
    super.key,
    required this.username,
    required this.expensesList,
    required this.incomeList,
    required this.totalExpensesAmount,
    required this.totalIncomesAmount,
  });

  @override
  State<HomeHeaderCard> createState() => _HomeHeaderCardState();
}

class _HomeHeaderCardState extends State<HomeHeaderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.37),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: mainColor, width: 4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: Image.asset("assets/images/user.jpg", width: 55),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                "Welcome ${widget.username}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Icon(Icons.notifications, color: mainColor, size: 35),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IncomeExpenseSmallCard(
                bgColor: greenColor,
                image: "assets/images/income.png",
                title: "Income",
                value: widget.totalIncomesAmount,
              ),
              IncomeExpenseSmallCard(
                bgColor: redColor,
                image: "assets/images/expense.png",
                title: "Expense",
                value: widget.totalExpensesAmount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
