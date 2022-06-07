import 'dart:typed_data';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:gcloud/storage.dart';
import 'package:mime/mime.dart';

class UploadAPI {
  final auth.ServiceAccountCredentials _credentials;
  //var _client;

  UploadAPI(String json) : _credentials = auth.ServiceAccountCredentials.fromJson(json);

  Future<ObjectInfo> save(String name, String fileName, Uint8List videoBytes) async {
    //if(_client == null)
     var _client = await auth.clientViaServiceAccount(_credentials, Storage.SCOPES);

    var storage = Storage(_client, 'lsp-app');
    var bucket = storage.bucket('lspvideosbucket');

    final type = lookupMimeType(fileName);
    return await bucket.writeBytes(name, videoBytes, metadata: ObjectMetadata(contentType: type));
  }
}