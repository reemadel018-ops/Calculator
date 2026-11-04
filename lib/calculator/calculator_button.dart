import 'package:calculator/calculator/calculator_color.dart';
import 'package:flutter/material.dart';

typedef OnButtonClick = void Function(String);

class CalculatorButton extends StatelessWidget {
  String text;
  Color? backgroundColor;
  Color? textColor;
  int? flex;
  Widget? child;
  bool isIcon;
  OnButtonClick onButtonClick;

  CalculatorButton({
    super.key,
    required this.onButtonClick,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.flex,
    this.child,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: FloatingActionButton(
          onPressed: () {
            onButtonClick(text);
          },
          backgroundColor: backgroundColor ?? CalculatorColors.darkGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: isIcon
              ? child
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? CalculatorColors.lightBlueColor,
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
