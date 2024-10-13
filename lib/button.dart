import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color? btnColor;
  final Color? txtColor;
  final void Function() onTap;

  const Button({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.btnColor,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 36,
        backgroundColor: btnColor,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32,
            color: txtColor,
            letterSpacing: 5,
          ),
        ),
      ),
    );
  }
}
