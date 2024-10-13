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
                onTap: () => onTapButton('%'),
                btnColor: ColorUtils.primaryButton,
                txtColor: ColorUtils.operatorText,
              ),
              Button(
                buttonText: '/',
                onTap: () => onTapButton('/'),
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
                onTap: () => onTapButton('7'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "8",
                onTap: () => onTapButton('8'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "9",
                onTap: () => onTapButton('9'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: 'X',
                onTap: () => onTapButton('x'),
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
                onTap: () => onTapButton('4'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "5",
                onTap: () => onTapButton('5'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "6",
                onTap: () => onTapButton('6'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: '-',
                onTap: () => onTapButton('-'),
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
                onTap: () => onTapButton('1'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "2",
                onTap: () => onTapButton('2'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: "3",
                onTap: () => onTapButton('3'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: '+',
                onTap: () => onTapButton('+'),
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
                onTap: () => onTapButton('0'),
                btnColor: ColorUtils.secondaryButton,
                txtColor: Colors.white,
              ),
              Button(
                buttonText: ".",
                onTap: () => onTapButton('.'),
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
          onTapButton(')');
          return;
        } else if (number[i] == ')' ||
            (!number.contains('(') && !number.contains(')'))) {
          onTapButton('(');
          return;
        }
      }
    });
  }

  void onTapButton(String txt) {
    setState(() {
      number += txt;
      _textEditingController.text = number;
      onAnswer();
    });
  }

  void onAnswer() {
    setState(() {
      String finalEquation = number;
      finalEquation = finalEquation.replaceAll('x', '*');

      Parser p = Parser();
      Expression exp = p.parse(finalEquation);
      ContextModel cm = ContextModel();
      answer = exp.evaluate(EvaluationType.REAL, cm);
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
