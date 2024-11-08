import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 54,
        width: 295,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F9746), Color(0xFFD1DD25)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(31.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
