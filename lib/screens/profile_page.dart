import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/screens/onboarding_screens.dart';
import 'package:expenz_flutter/services/expense_service.dart';
import 'package:expenz_flutter/services/income_service.dart';
import 'package:expenz_flutter/services/user_data_services.dart';
import 'package:expenz_flutter/widgets/profile_page_widgets/profile_card.dart';
import 'package:expenz_flutter/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    UserDataServices.getUserNameAndEmail().then((value) {
      if (value['username'] != null && value['useremail'] != null) {
        setState(() {
          username = value['username']!;
          email = value['useremail']!;
        });
      }
    });
  }

  //show scaffold message for logout
  void _showScafBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(color: greyColor.withOpacity(0.30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Logout?",
                style: TextStyle(
                  fontSize: 20,
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Are you sure you want to logout?",
                style: TextStyle(
                  fontSize: 15,
                  color: greyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      backgroundColor: whiteColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      backgroundColor: mainColor,
                    ),
                    onPressed: () async {
                      //clear user data
                      await UserDataServices.removeUserDetails();
                      //clear all expenses and incomes
                      await ExpenseService().deleteAllExpenses(context);
                      await IncomeService().deleteAllIncomes(context);

                      //navigating onboarding screens
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingScreens(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 18,
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //header section
                Row(
                  children: [
                    //user image
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Image.asset("assets/images/user.jpg", width: 80),
                      ),
                    ),

                    //username text and actually username
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 15,
                            color: greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        //SizedBox(height: 5),
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    //edit icon
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.20),
                            offset: Offset(0, 3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Icon(Icons.mode_edit_outlined, size: 30),
                    ),
                  ],
                ),

                //profile cards sections
                SizedBox(height: 50),
                ProfileCard(
                  title: "My wallet",
                  icon: Icons.wallet,
                  bgColor: mainColor,
                ),
                SizedBox(height: 20),
                ProfileCard(
                  title: "Settings",
                  icon: Icons.settings,
                  bgColor: mainColor,
                ),
                SizedBox(height: 20),
                ProfileCard(
                  title: "Export Data",
                  icon: Icons.download,
                  bgColor: mainColor,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _showScafBottom(context);
                  },
                  child: ProfileCard(
                    title: "LogOut",
                    icon: Icons.logout,
                    bgColor: redColor,
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
