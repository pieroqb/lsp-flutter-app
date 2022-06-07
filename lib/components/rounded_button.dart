import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;
  const RoundedButton ({
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.72,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: color,
          ),
          onPressed: press, 
          child: Text(text, style: TextStyle(color: textColor, fontSize: 16),)
        ),
      ),
    );
  }
}