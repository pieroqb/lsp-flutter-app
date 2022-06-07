import 'package:flutter/material.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  //final String content = "";
  const RoundedInputField({
    required this.hintText,
    required this.icon,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hintText,
          border: InputBorder.none
        ),
      )
    );
  }
}
