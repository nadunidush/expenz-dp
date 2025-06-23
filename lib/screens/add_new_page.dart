import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/models/expense_model.dart';
import 'package:expenz_flutter/models/income_model.dart';
import 'package:expenz_flutter/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //date changer
  DateTime _selectedDate = DateTime.now();

  //time changer
  DateTime _selectTime = DateTime.now();
  //select expense or income(expense=0, income=1)
  int _selectedIndex = 0;

  //onchange drop down menu item
  ExpenseCategories _expenseCategories = ExpenseCategories.shopping;
  IncomeCategories _incomeCategories = IncomeCategories.salary;

  //TextEditingControllers for form
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0 ? redColor : greenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10,
                ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
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
                        keyboardType: TextInputType.number,
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
              ),

              //Expense and Income form
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.66,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          value: _selectedIndex == 0
                              ? _expenseCategories
                              : _incomeCategories,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          items: _selectedIndex == 0
                              ? ExpenseCategories.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                }).toList()
                              : IncomeCategories.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedIndex == 0
                                  ? _expenseCategories =
                                        value as ExpenseCategories
                                  : _incomeCategories =
                                        value as IncomeCategories;
                            });
                          },
                        ),

                        //title field
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: "Title",
                            hintStyle: TextStyle(color: greyColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                        ),

                        //description field
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(color: greyColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                        ),

                        //amount field
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Amount",
                            hintStyle: TextStyle(color: greyColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                        ),

                        //date picker
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  initialDate: DateTime.now(),
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  } else {
                                    print("null");
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: whiteColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Select Date",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              DateFormat('MMMM EEEE d').format(_selectedDate),
                              style: TextStyle(
                                color: greyColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        //Time picker
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        value.hour,
                                        value.minute,
                                      );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time, color: whiteColor),
                                    SizedBox(width: 5),
                                    Text(
                                      "Select Time",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              DateFormat('jm').format(_selectTime),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        //Divider()
                        Divider(
                          color: greyColor.withOpacity(0.30),
                          thickness: 3,
                        ),

                        SizedBox(height: 20),
                        CustomButton(
                          title: "Add",
                          bgColor: _selectedIndex == 0 ? redColor : greenColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
