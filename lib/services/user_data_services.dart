import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataServices {
  static Future<void> storeUserDetails({
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check the password and confirm password match
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Passowrd and Confirm password does not match!!!"),
          ),
        );
        return;
      }
      //After matching passwords then store the username and email.
      SharedPreferences prefex = await SharedPreferences.getInstance();
      prefex.setString("username", userName);
      prefex.setString("useremail", userEmail);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("User details store sucessfully")));
    } catch (e) {
      print(e.toString());
    }
  }

  //method or function for check username for rendering the page accordinglty.

  static Future<bool> checkUsername() async {
    SharedPreferences prefix = await SharedPreferences.getInstance();
    String? username = prefix.getString('username');
    return username != null;
  }
}
