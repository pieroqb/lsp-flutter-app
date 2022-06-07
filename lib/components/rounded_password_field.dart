import 'package:flutter/material.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(Icons.lock, color: kPrimaryColor ),
          //suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
          border: InputBorder.none
        ),
      ),
    );
  }
}

