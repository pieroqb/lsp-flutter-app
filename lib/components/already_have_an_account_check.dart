import 'package:flutter/material.dart';
import 'package:lsp_app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function() press;
  const AlreadyHaveAnAccountCheck({
    this.login = true,
    required this.press
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login? "¿No tienes una cuenta?  " : "¿Ya tienes una cuenta?  ", 
          style: TextStyle(color: kPrimaryColor)
        ),
        /*GestureDetector(
          onTap: press,
          child: Text(
            login? "Regístrate" : "Ingresar",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
          )
        )*/
        Text(
          login? "Desliza a la derecha →" : "← Desliza a la izquierda", 
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
        )
      ],
    );
  }
}

