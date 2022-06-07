import 'package:flutter/material.dart';
import 'package:lsp_app/constants.dart';

class OrDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;    
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width*0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "O",
              style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600)
            ),
          ),
          buildDivider(),
        ],
      )
    );
  }

  Expanded buildDivider() {
    return Expanded(
          child: Divider(
            color: kPrimaryColor,
            height: 1.5,
          )
        );
  }
}