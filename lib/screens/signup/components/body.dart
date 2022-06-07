import 'package:flutter/material.dart';
import 'package:lsp_app/authentication_service.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/screens/signup/components/background.dart';
import 'package:lsp_app/screens/login/login_screen.dart';
import 'package:lsp_app/components/rounded_input_field.dart';
import 'package:lsp_app/components/rounded_password_field.dart';
import 'package:lsp_app/components/rounded_button.dart';
import 'package:lsp_app/components/already_have_an_account_check.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            Text("SIGNUP", style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height*0.04),
            Image(image: AssetImage('assets/gesture.png'), height: size.height*0.25),
            RoundedInputField(
              hintText: "Correo electrónico",
              icon: Icons.person,
              onChanged: (value){ userEmail = value; },
            ),
            RoundedPasswordField(
              onChanged: (value){ userPassword = value;} 
            ),
            RoundedButton(
              text: "SIGNUP", 
              press: () { 
                context.read<AuthenticationService>().signup(userEmail.trim(), userPassword.trim());
                final userID = context.read<AuthenticationService>().getCurrentUser();
                  if (userID == null) {
                   Fluttertoast.showToast(
                    msg: "El correo ingresado no es válido",
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red[100],
                    textColor: Colors.black,
                    fontSize: 16.0
                    );  
                  } 
              },
              color: kPrimaryColor, 
              textColor: Colors.white
            ),
            SizedBox(height: size.height*0.04),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return LoginScreen();
                    },
                  )
                );
              }
            ),

          ],
        ),
      )
    );
  }
}
