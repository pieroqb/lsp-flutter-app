import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsp_app/constants.dart';

class GalleryButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    title: Text(
      "Galería",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      leading: Icon(Icons.photo, size: 28, color: kPrimaryColor),
      onTap: () => pickGalleryMedia(context),
    );

    Future pickGalleryMedia(BuildContext context) async {
      final getMedia = ImagePicker().pickVideo;
      final media = await getMedia(source: ImageSource.gallery);

      if(media != null) {
        final file = File(media.path);
        Navigator.of(context).pop(file);
      }
      else return;
    } 

}