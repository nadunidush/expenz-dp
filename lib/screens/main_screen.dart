import 'package:expenz_flutter/models/income_model.dart';
import 'package:expenz_flutter/services/income_service.dart';
import 'package:flutter/material.dart';
import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/screens/add_new_page.dart';
import 'package:expenz_flutter/screens/home_page.dart';
import 'package:expenz_flutter/screens/profile_page.dart';
import 'package:expenz_flutter/screens/report_page.dart';
import 'package:expenz_flutter/screens/transactions_page.dart';
import 'package:expenz_flutter/services/expense_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  //create list for added expense
  List<ExpenseModel> expenseList = [];

  //create list for added incomes
  List<IncomeModel> incomeList = [];

  //fetch expenses
  void fetchAllExpenses() async {
    List<ExpenseModel> loadExpses = await ExpenseService().loadExpenses();
    setState(() {
      expenseList = loadExpses;
      print(expenseList.length);
    });
  }

  //save expense in shared preference
  void addNewExpense(ExpenseModel newExpses) {
    ExpenseService().saveExpense(newExpses, context);
    //update expense list
    setState(() {
      expenseList.add(newExpses);
    });
  }

  //fetch incomes
  void fetchAllIncomes() async {
    List<IncomeModel> loadIncomes = await IncomeService().loadIncomes();
    setState(() {
      incomeList = loadIncomes;
      print(incomeList.length);
    });
  }

  //save income in shared preferenses
  void addNewIncome(IncomeModel income) async {
    IncomeService().saveIncome(income, context);
    setState(() {
      incomeList.add(income);
    });
  }

  //remove expense from shared preferences
  void removeExpense(ExpenseModel expense) async {
    ExpenseService().removeExpense(expense.id, context);
    setState(() {
      expenseList.remove(expense);
    });
  }

  //remove income from shared preferences
  void removeIncomes(IncomeModel income) async {
    IncomeService().removeIncome(income.id, context);
    setState(() {
      incomeList.remove(income);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpenses();
      fetchAllIncomes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(),
      TransactionsPage(
        expenseList: expenseList,
        incomeList: incomeList,
        removeExpense: removeExpense,
        removeIncome: removeIncomes,
      ),
      AddNewPage(addExpenses: addNewExpense, addNewIncomes: addNewIncome),
      BudgetPage(),
      ProfilePage(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        selectedItemColor: mainColor,
        unselectedItemColor: greyColor,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        selectedIconTheme: IconThemeData(size: 27),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp),
            label: "Transact",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: mainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: whiteColor),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: "Profile"),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
