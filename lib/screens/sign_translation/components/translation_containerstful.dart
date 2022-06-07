import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lsp_app/screens/sign_translation/components/video_widget.dart';

class Translation_ContainerSTFUL extends StatefulWidget {
  final String title;
  final String body;
  final String fileName;
  const Translation_ContainerSTFUL(this.title, this.body, this.fileName);

  @override
  State<Translation_ContainerSTFUL> createState() => _Translation_ContainerSTFULState();
}

class _Translation_ContainerSTFULState extends State<Translation_ContainerSTFUL> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Card(
        margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  this.isExpanded = !isExpanded;
                });
              },
              children: <ExpansionPanel>[
                new ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      ListTile(
                        title: Text(widget.title, style: TextStyle(fontSize: 20))
                      ),
                  body: Column (
                    children: [
                      //Image(image: AssetImage('assets/translation_video.png')),
                      //Text(widget.fileName),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16,0,16,0),
                        child: VideoWidget(File(widget.fileName)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16,24,16,24), 
                        child: Text(widget.body, style: TextStyle(fontSize: 16))
                        )
                    ]
                  ),
                  isExpanded: this.isExpanded,
                ),
              ],
      )
      ),
    );
  }
}