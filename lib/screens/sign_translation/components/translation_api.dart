import 'dart:convert';

import 'package:http/http.dart' as http;

class TranslationObject {
  String? userID;
  String? title;
  String? fileName;
  //List<dynamic> translation = [];
  String? translation;

  TranslationObject({
    required this.userID,
    required this.title,
    required this.fileName,
    required this.translation
  });
}

class TranslationAPI {
  final url = "https://lsptesisapi-lrpgeek2za-uc.a.run.app/";

  Future<String> postTranslation(String userID, String title, String fileName) async {
    try {
      final jsonBody = jsonEncode({
        "fileName": fileName,
        "userID": userID,
        "title" : title
      });
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonBody
        );
      return response.body;
      
    } catch (e) {
      return e.toString();
    }
  }
  Future<List<TranslationObject>> getTranslations(String userID) async {
    try {
      final getURI = Uri.parse(url).replace(queryParameters: {
       'userID': userID
      });
      final response = await http.get(getURI);
      final data =  jsonDecode(response.body);
      //print(data[0]['translation'][0]);
      List<TranslationObject> translations = [];

      data.forEach(
        (value){
         translations.add(TranslationObject(
           userID: value['userID'], 
           title: value['title'],
           fileName: value['fileName'].split('/').last,
           translation: (value['translation']).join(' ')
         ));
      });
      //print(translations[0].translation);
      return(translations);

    } catch (e) {
      throw e; 
    }
  }
}