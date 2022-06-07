import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  String text = '';
  TextContainer(String text){this.text=text;}
   @override 
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, textAlign: TextAlign.left, style: TextStyle(fontSize: 24),),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
    );
  }
}
