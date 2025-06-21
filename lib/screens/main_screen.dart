import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/screens/add_new_page.dart';
import 'package:expenz_flutter/screens/home_page.dart';
import 'package:expenz_flutter/screens/profile_page.dart';
import 'package:expenz_flutter/screens/report_page.dart';
import 'package:expenz_flutter/screens/transactions_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  final List<Widget> screens = [
    HomePage(),
    TransactionsPage(),
    AddNewPage(),
    BudgetPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
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
