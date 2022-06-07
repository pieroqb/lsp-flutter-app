import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lsp_app/screens/sign_translation/components/translation_api.dart';
import 'components/translation_containerstful.dart';
import '../../hex_color.dart';
import 'package:lsp_app/screens/sign_translation/components/new_translation_button.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';


class SignTranslationScreen extends StatefulWidget {
  const SignTranslationScreen({ Key? key }) : super(key: key);

  @override
  State<SignTranslationScreen> createState() => _SignTranslationScreenState();
}

class _SignTranslationScreenState extends State<SignTranslationScreen> {
  //TranslationAPI translationAPI = TranslationAPI();
  late String path;
  late Future<List<TranslationObject>> translationsFuture;

  @override
  void initState(){
    /*final userID = context.read<AuthenticationService>().getCurrentUser();
    final trans  = await translationAPI.getTranslations(userID!);
    print(trans);*/
    super.initState();
    final userID = context.read<AuthenticationService>().getCurrentUser();
    //translationsFuture = translationAPI.getTranslations(userID!);

    translationsFuture = callAsyncs();
    /*WidgetsBinding.instance?.addPostFrameCallback((_) { 
     getApplicationDocumentsDirectory().then((value) => path = value.path );
    });*/
    /*
    WidgetsBinding.instance?.addPostFrameCallback((_) { 
      final userID = context.read<AuthenticationService>().getCurrentUser();
      translationsFuture = translationAPI.getTranslations(userID!)/*.then((value) => print(value))*/;
    });*/
  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: hexToColor('#eceff1'),
      appBar: AppBar(
        title: const Text('Mis traducciones'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<TranslationObject>>(
          future: translationsFuture,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              final error = snapshot.error;
              return Text(' :( $error ');
            }
            if (snapshot.connectionState != ConnectionState.done){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(color: kSecondaryColor,),
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
              );
            }     
            if(snapshot.hasData){
               List<TranslationObject>? data = snapshot.data!;
                print(path);
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   //SizedBox(height: 15),
                   for (var t in data ) Translation_ContainerSTFUL(t.title!, t.translation!, '$path/${t.fileName}.mp4'),
                   SizedBox(height: 15)
                 ]
               );
            }
            else return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(color: kSecondaryColor,),
                    height: 50,
                    width: 50,
                  ),
                )
              ],
            );
          },
        )

        ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btnRefresh",
            backgroundColor: Colors.white,
            onPressed: () => setState(() {
              //translationsFuture = null;
              translationsFuture = callAsyncs();
            }),  
            child: Icon(Icons.refresh, size: 36, color: kSecondaryColor),
          ),
          SizedBox(height: 15),
          NewTranslationButton()
        ]
      ),
    );
  }

  Future<List<TranslationObject>> callAsyncs() async {
    TranslationAPI translationAPI = TranslationAPI();
    final userID = context.read<AuthenticationService>().getCurrentUser();

    final Directory directory = await getApplicationDocumentsDirectory();
    path =  directory.path;
    

    return translationAPI.getTranslations(userID!);
  }
}