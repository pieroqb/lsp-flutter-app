import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lsp_app/page_container.dart';
import 'package:lsp_app/screens/sign_translation/components/translation_api.dart';
import 'package:lsp_app/screens/sign_translation/components/video_source.dart';
import 'package:lsp_app/screens/sign_translation/components/video_widget.dart';
import 'package:lsp_app/screens/sign_translation/components/upload_api.dart';
import 'package:lsp_app/components/rounded_input_field.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';


class NewTranslation extends StatefulWidget {
  const NewTranslation({ Key? key }) : super(key: key);

  @override
  State<NewTranslation> createState() => _NewTranslationState();
}

class _NewTranslationState extends State<NewTranslation> {
  File fileMedia = File(""); ///data/user/0/com.example.lsp_app/app_flutter/localpathtest3.mp4
  String fileMediaName = "";
  String translationTitle = "";
  late Uint8List fileBytes; 
  late UploadAPI uploadAPI;
  TranslationAPI translationAPI = TranslationAPI();
  bool isUploaded = false;
  bool loading = false;
  @override
  void initState(){
    super.initState();
    rootBundle.loadString('assets/credentials.json').then((json) {
      uploadAPI = UploadAPI(json);
    });
  }

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Nueva traducción"),
      backgroundColor: kSecondaryColor,
    ),
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: fileMedia.path == ""
              ? Icon(Icons.photo, size: 120)
              : VideoWidget(fileMedia),
            ),
            const SizedBox(height: 24),
            if (fileMedia.path != "")
              RoundedInputField(hintText: "Título para la traducción", icon: Icons.pan_tool_alt, onChanged: (value){ translationTitle = value; } ),
            fileMedia.path == ""
            ?
            ElevatedButton(
              onPressed: () => capture(),
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              child: Text('Seleccionar fuente')
            )
            :
            ElevatedButton(
              onPressed: () => upload(),
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              child: Text('Enviar video')
            )
          ],
        )
      )
    )
  );
   
   Future capture() async {
    setState(() {
      this.fileMedia = File("");
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VideoSource(),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
        fileMediaName = fileMedia.path.split('/').last;
        print(fileMediaName);
        fileBytes = fileMedia.readAsBytesSync();
        isUploaded = false;
      });
    }
  }

  void upload() async {

    setState(() {
      loading = true;
      showTranslationDialog(context);
    });
    final uuid = Uuid();
    final translationID = uuid.v1();

    final userID = context.read<AuthenticationService>().getCurrentUser();
    final saveTitle = '$userID/videos/$translationID';

    final uploadResponse = await uploadAPI.save(saveTitle, fileMediaName, fileBytes);
    print(uploadResponse.downloadLink);

    final postResponse = await translationAPI.postTranslation(userID!, translationTitle, translationID);
    print(postResponse);
    //save to local directory 
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path =  directory.path;
    print(path);
    final File copyFile = await fileMedia.copy('$path/$translationID.mp4');
    print(copyFile.path);

    setState(() {
      loading = false;
      isUploaded = true;
      Navigator.of(context, rootNavigator: true).pop();
      showTranslationDialog(context);
    });
    /*
    final userID = await context.read<AuthenticationService>().getCurrentUser();
    translationAPI.getTranslations(userID!);*/

  }
  Future showTranslationDialog(BuildContext context) => showDialog (
  context: context,
  barrierDismissible: false,
  builder: (context) => SimpleDialog(
    title: Text('Envío de video'),
    children: <Widget>[
      if(loading) Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child:CircularProgressIndicator(color: kSecondaryColor)),
      ),/*
      if(isUploaded) Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text('Video enviado correctamente. El video tardará unos minutos en traducirse.'),
      ),
      if (isUploaded) ElevatedButton(
        onPressed: () => Navigator.of(context)..pop()..pop(),
        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
        child: Text("Entendido")
      )*/
      if(isUploaded) Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
           padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
           child: Text('Video enviado correctamente. El video tardará unos minutos en traducirse.', style: TextStyle(fontSize: 16),),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context)..pop()..pop(),
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            child: Text("Entendido")
          )
        ],
      )
      /*
      SimpleDialogOption(
        onPressed: () {},
        child: Text('Galería'),
      ),
      SimpleDialogOption(
        onPressed: () {},
        child: Text('Cámara'),
      )*/
    ],
  )
);
}


