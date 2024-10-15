import 'package:flutter/material.dart';
import 'package:simple_calculator_2/color_utils.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number = '';
  double answer = 0;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 270,
            child: Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _textEditingController,
                    readOnly: true,
                    autofocus: true,
                    showCursor: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 60),
                  FittedBox(
                    child: Text(
                      '$answer',
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 28),
            child: IconButton(
              onPressed: onBackSpace,
              icon: const Icon(
                Icons.backspace_outlined,
                color: ColorUtils.operatorText,
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          mainButtons(screenSize),
        ],
      ),
    );
  }

  Container mainButtons(Size screenSize) {
    return Container(
      width: screenSize.width,
      height: screenSize.height - 340,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "C",
                onTap: onClear,
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.clearText,
              ),
              Button(
                buttonText: "()",
                onTap: onTapBraces,
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
              Button(
                buttonText: "%",
                onTap: () => onTapNumber('%'),
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
              Button(
                buttonText: '/',
                onTap: () => onTapNumber('/'),
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "7",
                onTap: () => onTapNumber('7'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "8",
                onTap: () => onTapNumber('8'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "9",
                onTap: () => onTapNumber('9'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: 'X',
                onTap: () => onTapNumber('x'),
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "4",
                onTap: () => onTapNumber('4'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "5",
                onTap: () => onTapNumber('5'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "6",
                onTap: () => onTapNumber('6'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: '-',
                onTap: () => onTapNumber('-'),
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "1",
                onTap: () => onTapNumber('1'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "2",
                onTap: () => onTapNumber('2'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "3",
                onTap: () => onTapNumber('3'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: '+',
                onTap: () => onTapNumber('+'),
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "+/-",
                onTap: onNegativeNum,
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "0",
                onTap: () => onTapNumber('0'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: ".",
                onTap: () => onTapNumber('.'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: '=',
                onTap: onEqualButton,
                btnColor: const Color(0xFF318507),
                txtColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onBackSpace() {
    setState(() {
      if (number.length == 1) {
        number = '';
        _textEditingController.text = number;
        answer = 0;
      } else {
        number = number.substring(0, number.length - 1);
        _textEditingController.text = number;
        onAnswer();
      }
    });
  }

  void onClear() {
    setState(() {
      number = '';
      _textEditingController.text = number;
      answer = 0;
    });
  }

  void onTapBraces() {
    setState(() {
      for (int i = number.length - 1; i >= 0; i--) {
        if (number[i] == '(') {
          onTapNumber(')');
          return;
        } else if (number[i] == ')' ||
            (!number.contains('(') && !number.contains(')'))) {
          onTapNumber('(');
          return;
        }
      }
    });
  }

  void onTapNumber(String txt) {
    setState(() {
      // This is used if someone do basic operation after percentage calculation.
      /* We check if **number contains '%' character and if the last character
      * of **number is not '%' and if the user press '+' or '-' or 'x' or '/'
      * button.*/
      // Then we will store **answer in **number
      if (number.contains('%') &&
          number.substring(number.length - 1) != '%' &&
          (txt == '+' || txt == '-' || txt == 'x' || txt == '/')) {
        number = answer.toString();
        _textEditingController.text = number;
      }

      /*
      *  When user press any number or operator it will
      *  append in the end of **number
      * */
      number += txt;
      _textEditingController.text = number;
      onAnswer();
    });
  }

  void onAnswer() {
    setState(() {
      String finalEquation = number;
      finalEquation = finalEquation.replaceAll('x', '*');

      if (finalEquation.contains('%')) {
        //  This is for percentage calculation.
        //  For example 9%2 = 0.18, it means 9 x (2 / 100) = 0.18
        //  Split the **finalEquation in '%' character
        // Initialize the **finalAnswer to double form the fist element of **lst
        // Then calculate the **finalAnswer using loop
        // Then store **finalAnswer into **answer
        try {
          List<String> lst = finalEquation.split('%');
          double finalAnswer = double.parse(lst.first);

          for (int i = 1; i < lst.length; i++) {
            finalAnswer *= (double.parse(lst[i]) / 100);
          }

          answer = finalAnswer;
        } catch (e) {
          answer = 0;
        }
      } else {
        // This is used for parsing any equation
        // Here, we used a third party package for parsing equation
        // Package name is math_expression
        try {
          Parser p = Parser();
          Expression exp = p.parse(finalEquation);
          ContextModel cm = ContextModel();
          answer = exp.evaluate(EvaluationType.REAL, cm);
        } catch (e) {
          answer = 0;
        }
      }
    });
  }

  void onNegativeNum() {
    setState(() {
      number = '-$number';
      _textEditingController.text = number;
      onAnswer();
    });
  }

  void onEqualButton() {
    setState(() {
      _textEditingController.text = answer.toString();
    });
  }
}
