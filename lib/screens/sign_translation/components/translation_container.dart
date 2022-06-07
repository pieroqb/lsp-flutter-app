import 'package:flutter/material.dart';

class Translation_Container extends StatelessWidget {
  String text;
  Translation_Container(this.text);
   @override 
  Widget build(BuildContext context) {
    return 
    Card (
      margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Padding (
      padding: EdgeInsets.fromLTRB(16,20,16,20),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(this.text, style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,)),
          //SizedBox(width: 140),
          Text('66%', style: TextStyle(fontSize: 20))
        ]
      )
    )
    );
  }
}
