import 'package:flutter/material.dart';
import 'package:lsp_app/authentication_service.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/screens/login/components/background.dart';
import 'package:lsp_app/components/rounded_input_field.dart';
import 'package:lsp_app/components/rounded_password_field.dart';
import 'package:lsp_app/components/rounded_button.dart';
import 'package:lsp_app/components/already_have_an_account_check.dart';
import 'package:lsp_app/screens/login/components/or_divider.dart';
import 'package:lsp_app/screens/signup/signup_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userEmail = "";
    String userPassword = "";

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LOGIN", style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height*0.04),
            Image(image: AssetImage('assets/sign-language.png'), height: size.height*0.25),
            SizedBox(height: size.height*0.04),
            RoundedInputField(
              hintText: "Correo electrónico",
              icon: Icons.person,
              onChanged: (value) { userEmail = value; },
            ),
            RoundedPasswordField(onChanged: (value) { userPassword = value; }),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor, 
              textColor: Colors.white,
              press: () {
                context.read<AuthenticationService>().login(userEmail.trim(), userPassword.trim());
              }
            ),
            OrDivider(),
            SignInButton(
              Buttons.GoogleDark,
              text: "    Ingresar con Google",
              onPressed: () {
                context.read<AuthenticationService>().googleLogin(); 
              }
            ),
            SizedBox(height: size.height*0.04),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                    return SignupScreen();
                    },
                  ),
                );
              }
            )
          ],
        ),
      )
    );
  }
}

