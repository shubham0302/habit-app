import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../infrastructure/db/app_service.dart';
import 'package:drift/drift.dart' as drift;

class DBController extends GetxController {
  AppDB appDB = AppDB();
  // Future<String> getFilePath() async {
  //   Directory appDocumentsDirectory =
  //       await getApplicationDocumentsDirectory(); // 1
  //   String appDocumentsPath = appDocumentsDirectory.path; // 2
  //   String filePath = '$appDocumentsPath/my_database.db'; // 3

  //   return filePath;
  // }

  

  List<Map<String, dynamic>> defaultString = [
    {"id": 1, "name": "Quit a habbit", "icon": 0, "color": 0},
    {"id": 2, "name": "Art", "icon": 1, "color": 1},
    {"id": 3, "name": "Task", "icon": 2, "color": 2},
    {"id": 4, "name": "Meditation", "icon": 3, "color": 3},
    {"id": 5, "name": "Study", "icon": 4, "color": 4},
    {"id": 6, "name": "Sports", "icon": 5, "color": 0},
    {"id": 7, "name": "Entertainment", "icon": 6, "color": 1},
    {"id": 8, "name": "Social", "icon": 7, "color": 2},
    {"id": 9, "name": "Finance", "icon": 8, "color": 3},
    {"id": 10, "name": "Health", "icon": 0, "color": 4},
    {"id": 11, "name": "Work", "icon": 1, "color": 0},
    {"id": 12, "name": "Nutrition", "icon": 2, "color": 1},
    {"id": 13, "name": "Home", "icon": 3, "color": 2},
    {"id": 14, "name": "Outdoor", "icon": 4, "color": 3},
    {"id": 15, "name": "Other", "icon": 5, "color": 4},
  ];
  addDefault() async {
    var data = await appDB.getCategories();
    if (data.length < defaultString.length) {
      await Future.forEach(defaultString, (element) async {
        var entity = CategoryModelCompanion(
            color: drift.Value(element['color']),
            icon: drift.Value(element['icon']),
            isDefault: const drift.Value(true),
            name: drift.Value(element['name']));

        await appDB.insertCategory(entity);
      });
    }
  }
  

  @override
  void onInit() {
    addDefault();
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }
}
