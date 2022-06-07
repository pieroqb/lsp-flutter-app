import 'package:flutter/material.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/screens/welcome/components/background.dart';
import 'package:lsp_app/screens/login/login_screen.dart';
import 'package:lsp_app/screens/signup/signup_screen.dart';
import 'package:lsp_app/components/rounded_button.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;    
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bienvenido a LSP-APP", style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height*0.04),
            Image(image: AssetImage('assets/signs.png'), height: size.height*0.4),
            SizedBox(height: size.height*0.06),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () { 
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) { 
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kSecondaryColor,
              textColor: Colors.white,
              press: () { 
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) { 
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
