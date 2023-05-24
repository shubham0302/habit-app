import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:habbit_app/helpers/local_storage_helper.dart';
import 'package:habbit_app/utilities/file_utils.dart';
import 'package:path/path.dart' as path;

LazyDatabase openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getDownloadsDirectoryToSaveData();
    final file = File(path.join(dbFolder!.path, 'db.sqlite'));
    LocalStorageHelper.storeCreatedDatabasePath(pathOfTheDatabase: file.path);
    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/my_database.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return NativeDatabase.createInBackground(file);
  });
}
