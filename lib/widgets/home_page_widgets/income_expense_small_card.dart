import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenseSmallCard extends StatefulWidget {
  final Color bgColor;
  final String image;
  final String title;
  final int value;
  const IncomeExpenseSmallCard({super.key, required this.bgColor, required this.image, required this.title, required this.value});

  @override
  State<IncomeExpenseSmallCard> createState() => _IncomeExpenseSmallCardState();
}

class _IncomeExpenseSmallCardState extends State<IncomeExpenseSmallCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(widget.image, width: 50),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: whiteColor,
                ),
              ),
              Text(
                "\$${widget.value}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
