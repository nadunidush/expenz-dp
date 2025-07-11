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
      await prefex.setString("username", userName);
      await prefex.setString("useremail", userEmail);

      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
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

  //get the username and email
  static Future<Map<String, String>> getUserNameAndEmail() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    String? username = prefers.getString("username");
    String? email = prefers.getString("useremail");

    return {"username": username!, "useremail": email!};
  }

  //remove user all details
  static Future<void> removeUserDetails() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    await prefes.remove("username");
    await prefes.remove("useremail");
  }
}
