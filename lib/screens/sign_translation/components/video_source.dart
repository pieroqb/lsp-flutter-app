import 'package:flutter/material.dart';
import 'package:lsp_app/screens/sign_translation/components/camera_button.dart';
import 'package:lsp_app/screens/sign_translation/components/gallery_button.dart';
import 'package:lsp_app/constants.dart';

class VideoSource extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar fuente'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          CameraButtonWidget(),
          GalleryButtonWidget(),
        ],
      ),
    );
  }
}