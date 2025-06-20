import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/screens/main_screen.dart';
import 'package:expenz_flutter/services/user_data_services.dart';
import 'package:expenz_flutter/widgets/shared/custom_button.dart';
import 'package:expenz_flutter/widgets/user_data_widgets/user_form_card.dart';
import 'package:flutter/material.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({super.key});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  //remember me bool value
  bool _rememberMe = false;

  //form key
  final _formKey = GlobalKey<FormState>();

  //controllers for all fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Enter your\nPersonal Details",
                  style: TextStyle(
                    fontSize: 33,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Name field
                      UserFormCard(
                        hintText: "Name",
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      //Email field
                      UserFormCard(
                        hintText: "Email",
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      //password field
                      UserFormCard(
                        hintText: "Password",
                        icon: Icons.remove_red_eye_outlined,
                        secure: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter valid password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      //confirma password field
                      UserFormCard(
                        hintText: "Confirm password",
                        icon: Icons.remove_red_eye_outlined,
                        secure: true,
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter same password";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20),
                      //remember me for next time
                      Row(
                        children: [
                          Text(
                            "Remember me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              color: greyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Expanded(
                            child: CheckboxListTile(
                              activeColor: mainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  if (_rememberMe) {
                                    _rememberMe != value;
                                  } 
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40),
                      //Next buttom
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            String name = _nameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            await UserDataServices.storeUserDetails(
                              userName: name,
                              userEmail: email,
                              password: password,
                              confirmPassword: confirmPassword,
                              context: context,
                            );

                            //Navigate to the main screen
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            }
                          }
                        },
                        child: CustomButton(title: "Next", bgColor: mainColor),
                      ),
                    ],
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
