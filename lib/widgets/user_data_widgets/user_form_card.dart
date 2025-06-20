import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class UserFormCard extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final bool secure;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  const UserFormCard({
    super.key,
    required this.hintText,
    this.icon,
    this.secure = false, required this.controller, required this.validator,
  });

  @override
  State<UserFormCard> createState() => _UserFormCardState();
}

class _UserFormCardState extends State<UserFormCard> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator:widget.validator,
      obscureText: widget.secure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: greyColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 10, color: greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(20),
        suffixIcon: Icon(widget.icon, size: 25, color: greyColor),
      ),
    );
  }
}
