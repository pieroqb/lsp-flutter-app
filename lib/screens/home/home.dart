import 'package:flutter/material.dart';
import '../../components/text_container.dart';
import '../../hex_color.dart';
import 'package:lsp_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:lsp_app/authentication_service.dart';

class HomeScreen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: hexToColor('#eceff1'),
      appBar: AppBar(
        title: const Text('¡Bienvenido/a a LSP-app!'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          TextContainer('Esta aplicación utiliza inteligencia artificial para traducir la Lengua de Señas Peruana a texto.'),
          SizedBox(height: 20),
          TextContainer('Actualmente, la aplicación reconoce las siguientes señas:'),
          SizedBox(height: 20),
          TextContainer('\u2022  Alergia'),
          SizedBox(height: 5),
          TextContainer('\u2022  Ayuda'),
          SizedBox(height: 5),
          TextContainer('\u2022  Baño'),
          SizedBox(height: 5),
          TextContainer('\u2022  Bien'),
          SizedBox(height: 5),
          TextContainer('\u2022  Doctor'),
          SizedBox(height: 5),
          TextContainer('\u2022  Dolor'),
          SizedBox(height: 5),
          TextContainer('\u2022  Donde'),
          SizedBox(height: 5),
          TextContainer('\u2022  Gracias'),
          SizedBox(height: 5),
          TextContainer('\u2022  Hora'),
          SizedBox(height: 5),
          TextContainer('\u2022  Mi'),
          SizedBox(height: 5),
          TextContainer('\u2022  Necesito'),
          SizedBox(height: 5),
          TextContainer('\u2022  Nombre'),
          SizedBox(height: 5),
          TextContainer('\u2022  Pastilla'),
          SizedBox(height: 5),
          TextContainer('\u2022  Que'),
          SizedBox(height: 5),
          TextContainer('\u2022  Sentir'),
          SizedBox(height: 5),
          TextContainer('\u2022  Tomar'),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              style: ElevatedButton.styleFrom(primary: Colors.pink),
              child: Text("Cerrar sesión"),
            ),
        ],
        )
        )
    );
  }
}