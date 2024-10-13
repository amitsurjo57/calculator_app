import 'package:flutter/material.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number = '';

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
                    showCursor: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    number = number.substring(0, number.length - 1);
                    _textEditingController.text = number;
                  });
                },
                icon: const Icon(Icons.backspace),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            children: [
              mainButtons(screenSize),
              operatorButtons(screenSize),
            ],
          )
        ],
      ),
    );
  }

  Container mainButtons(Size screenSize) {
    return Container(
      width: 280,
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
                onTap: () {
                  setState(() {
                    number = '';
                    _textEditingController.text = number;
                  });
                },
              ),
              Button(
                buttonText: "()",
                onTap: () {
                  setState(() {
                    for (int i = number.length - 1; i >= 0; i--) {
                      if (number[i] == '(') {
                        onTapButton(')');
                        return;
                      } else if (number[i] == ')' ||
                          (!number.contains('(') &&
                          !number.contains(')'))) {
                        onTapButton('(');
                        return;
                      }
                    }
                  });
                },
              ),
              Button(
                buttonText: "%",
                onTap: () => onTapButton('%'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "7",
                onTap: () => onTapButton('7'),
              ),
              Button(
                buttonText: "8",
                onTap: () => onTapButton('8'),
              ),
              Button(
                buttonText: "9",
                onTap: () => onTapButton('9'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "4",
                onTap: () => onTapButton('4'),
              ),
              Button(
                buttonText: "5",
                onTap: () => onTapButton('5'),
              ),
              Button(
                buttonText: "6",
                onTap: () => onTapButton('6'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "1",
                onTap: () => onTapButton('1'),
              ),
              Button(
                buttonText: "2",
                onTap: () => onTapButton('2'),
              ),
              Button(
                buttonText: "3",
                onTap: () => onTapButton('3'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonText: "+/-",
                onTap: () => onTapButton('+/-'),
              ),
              Button(
                buttonText: "0",
                onTap: () => onTapButton('0'),
              ),
              Button(
                buttonText: ".",
                onTap: () => onTapButton('.'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container operatorButtons(Size screenSize) {
    return Container(
      width: screenSize.width - 280,
      height: screenSize.height - 340,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Button(
            buttonText: '/',
            onTap: () => onTapButton('/'),
          ),
          Button(
            buttonText: 'X',
            onTap: () => onTapButton('X'),
          ),
          Button(
            buttonText: '-',
            onTap: () => onTapButton('-'),
          ),
          Button(
            buttonText: '+',
            onTap: () => onTapButton('+'),
          ),
          Button(
            buttonText: '=',
            onTap: () => onTapButton('='),
          ),
        ],
      ),
    );
  }

  void onTapButton(String txt) {
    setState(() {
      number += txt;
      _textEditingController.text = number;
    });
  }
}
