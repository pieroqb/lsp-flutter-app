import 'package:flutter/material.dart';
import 'package:lsp_app/screens/signup/signup_screen.dart';
import 'package:lsp_app/screens/login/login_screen.dart';


class Authentication_Container extends StatefulWidget {
  const Authentication_Container({ Key? key }) : super(key: key);

  @override
  State<Authentication_Container> createState() => _Authentication_ContainerState();
}

class _Authentication_ContainerState extends State<Authentication_Container> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        children: [
          LoginScreen(),
          SignupScreen(),
        ],
    );
  }
}