import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lsp_app/constants.dart';
import 'package:lsp_app/screens/speech_translation/components/speech_api.dart';
import 'package:lsp_app/hex_color.dart';

class SpeechTranslationScreen extends StatefulWidget {
  const SpeechTranslationScreen({ Key? key }) : super(key: key);

  @override
  State<SpeechTranslationScreen> createState() => _SpeechTranslationScreenState();
}

class _SpeechTranslationScreenState extends State<SpeechTranslationScreen> {
  String text = 'Presione el botón y empiece a hablar';
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
      backgroundColor: hexToColor('#eceff1'),
      appBar: AppBar(
        title: const Text('Voz a texto'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(30).copyWith(bottom: 150),
        child: Text(text, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400))
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        endRadius: 75,
        glowColor: kSecondaryColor,
        child: FloatingActionButton(
          backgroundColor: kSecondaryColor,
          child: Icon(isListening? Icons.mic : Icons.mic_none, size: 36),
          onPressed: toggleRecording,
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechAPI.toggleRecording(
    onResult: (text) => setState(() => this.text = text),
    onListening: (isListening) { setState(() => this.isListening = isListening); }
  );
}