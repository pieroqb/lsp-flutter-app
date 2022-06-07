import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/screens/sign_translation/components/new_translation.dart';

class NewTranslationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "btnNewTranslation",
      backgroundColor: kSecondaryColor,
      onPressed: () /*{ showTranslationDialog(context);},*/
         { 
           Navigator.push(
             context, 
             MaterialPageRoute(
               builder: (context) { 
                 return NewTranslation();
               },
             ),
           );
        },
      child: Icon(Icons.publish_sharp, size: 36),
    );
  }
}


Future pickGalleryMedia(BuildContext context) async {
  final getMedia = ImagePicker().pickVideo;
  final media = await getMedia(source: ImageSource.gallery);

  if(media != null) {
    final file = File(media.path);
    Navigator.of(context).pop(file);
  }
  else return;
}

Future pickCameraMedia(BuildContext context) async {
  final getMedia = ImagePicker().pickVideo;
  final media = await getMedia(source: ImageSource.camera);

  if(media != null) {
    final file = File(media.path);
    Navigator.of(context).pop(file);
  }
  else return;
}

