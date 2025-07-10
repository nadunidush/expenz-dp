import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Icon(Icons.arrow_downward),
              SizedBox(width: 5),
              Text(
                "Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.menu_outlined),
        ),
      ],
    );
  }
}
