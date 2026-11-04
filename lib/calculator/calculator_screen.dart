import 'package:calculator/calculator/calculator_button.dart';
import 'package:calculator/calculator/calculator_color.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});
  static const String routeName = 'calculator';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
  String resText = '';
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: AlignmentGeometry.centerRight,
                child: Text(
                  resText,
                  style: TextStyle(
                    color: CalculatorColors.whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                spacing: 18,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: 'AC',
                                onButtonClick: onClearClick,
                                backgroundColor:
                                    CalculatorColors.lightGreyColor,
                                textColor: CalculatorColors.whiteColor,
                              ),
                              CalculatorButton(
                                text: 'x',
                                onButtonClick: onBackSpaceClick,
                                isIcon: true,
                                backgroundColor:
                                    CalculatorColors.lightGreyColor,
                                textColor: CalculatorColors.whiteColor,
                                child: Icon(
                                  Icons.backspace_outlined,
                                  color: CalculatorColors.whiteColor,
                                  size: 28,
                                ),
                              ),
                              CalculatorButton(
                                text: '/',
                                onButtonClick: onOperatorClick,
                                backgroundColor: CalculatorColors.darkBlueColor,
                                textColor: CalculatorColors.whiteColor,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: '7',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '8',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '9',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: '4',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '5',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '6',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: '1',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '2',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '3',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                flex: 2,
                                text: '0',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                              CalculatorButton(
                                text: '.',
                                onButtonClick: onDigitClick,
                                backgroundColor: CalculatorColors.darkGreyColor,
                                textColor: CalculatorColors.lightBlueColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CalculatorButton(
                          flex: 2,
                          text: '*',
                          onButtonClick: onOperatorClick,
                          backgroundColor: CalculatorColors.darkBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                        CalculatorButton(
                          flex: 2,
                          text: '-',
                          onButtonClick: onOperatorClick,
                          backgroundColor: CalculatorColors.darkBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                        CalculatorButton(
                          flex: 3,
                          text: '+',
                          onButtonClick: onOperatorClick,
                          backgroundColor: CalculatorColors.darkBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                        CalculatorButton(
                          flex: 3,
                          text: '=',
                          onButtonClick: onEqualClick,
                          backgroundColor: CalculatorColors.lightBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String text) {
    if (text == '.' && resText.contains('.')) {
      return;
    }
    resText += text;
    setState(() {});
  }

  String lhs = '';
  String operator = '';

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;
      lhs = calculate(lhs, operator, rhs);
    }
    operator = clickedOperator;
    resText = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);

    double res = 0.0;
    if (operator == '+') {
      res = num1 + num2;
    } else if (operator == '*') {
      res = num1 * num2;
    } else if (operator == '-') {
      res = num1 - num2;
    } else if (operator == '/') {
      res = num1 / num2;
    }
    return res.toString();
  }

  void onEqualClick(String text) {
    String rhs = resText;
    resText = calculate(lhs, operator, rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClearClick(String text) {
    resText = '';
    lhs = '';
    operator = '';

    setState(() {});
  }

  void onBackSpaceClick(String text) {
    if (resText.isEmpty) {
      return;
    }
    resText = resText.substring(0, resText.length - 1);
    setState(() {});
  }
}
