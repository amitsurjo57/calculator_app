import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const Button({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: 32,
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
