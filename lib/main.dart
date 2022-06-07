import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lsp_app/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:lsp_app/page_container.dart';
import 'package:lsp_app/authentication_container.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance)
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        home: AuthenticationWrapper()
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    //print(firebaseUser);
    if (firebaseUser != null) {;
      Fluttertoast.showToast(
      msg: "¡Autenticado!",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.cyan[100],
      textColor: Colors.black,
      fontSize: 16.0
      );
      return PageContainer();
    }
    return Authentication_Container();
  }
}