import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory?> getDownloadsDirectoryToSaveData() async {
  if (Platform.isAndroid) {
    var directory = await getExternalStorageDirectory();
    var newPath = '';
    final paths = directory!.path.split('/');
    for (var x = 1; x < paths.length; x++) {
      final folder = paths[x];
      if (folder != 'Android') {
        newPath += '/$folder';
      } else {
        break;
      }
    }
    newPath = '$newPath/Download';
    return directory = Directory(newPath);
  } else if (Platform.isIOS) {
    final dir = await getApplicationDocumentsDirectory();
    return dir;
  }
  return null;
}