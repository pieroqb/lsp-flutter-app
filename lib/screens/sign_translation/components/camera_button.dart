import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsp_app/constants.dart';

class CameraButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    title: Text(
      "Cámara",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.camera_alt, size: 28, color: kPrimaryColor),
      onTap: () => pickCameraMedia(context),
    );

   Future pickCameraMedia(BuildContext context) async {
     final getMedia = ImagePicker().pickVideo;
      final media = await getMedia(source: ImageSource.camera);

      if(media != null) {
        final file = File(media.path);
        Navigator.of(context).pop(file);
     }
      else return;
    }


}