import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/sign_translation/sign_translation_screen.dart';
import 'package:lsp_app/screens/speech_translation/speech_screen.dart';

class PageContainer extends StatefulWidget {
  const PageContainer({ Key? key }) : super(key: key);

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        children: [
          HomeScreen(),
          SignTranslationScreen(),
          SpeechTranslationScreen(),
        ],
    );
  }
}