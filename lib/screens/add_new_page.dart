import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0 ? redColor : greenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Expenses container
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                              color: _selectedIndex == 0 ? redColor : null,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Expense",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: _selectedIndex == 0
                                    ? whiteColor
                                    : blackColor,
                              ),
                            ),
                          ),
                        ),

                        //Income container
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                              color: _selectedIndex == 1 ? greenColor : null,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Income",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: _selectedIndex == 1
                                    ? whiteColor
                                    : blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //how much field(normaly getting the only value for identify to put amount)
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.33,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How much?",
                        style: TextStyle(
                          fontSize: 17,
                          color: whiteColor.withOpacity(0.60),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Expense and Income form
              ],
            ),
          ),
        ),
      ),
    );
  }
}
