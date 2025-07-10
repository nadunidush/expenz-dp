import 'package:expenz_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final double amount;
  final double total;
  final Color categoryColor;
  final bool isExpense;
  const CategoryItem({
    super.key,
    required this.title,
    required this.amount,
    required this.categoryColor,
    required this.total,
    required this.isExpense,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.50),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: widget.categoryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    SizedBox(width: 7),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              //amount
              Text(
                "-\$${widget.amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: widget.isExpense ? redColor : greenColor,
                ),
              ),
            ],
          ),

          //ProgressLinearIndicator
          SizedBox(height: 10),
          LinearProgressIndicator(
            minHeight: 15,
            borderRadius: BorderRadius.circular(100),
            value: widget.amount / widget.total,
            valueColor: AlwaysStoppedAnimation(widget.categoryColor),
          ),
        ],
      ),
    );
  }
}
