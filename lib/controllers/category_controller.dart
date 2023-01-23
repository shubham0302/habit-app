// ignore_for_file: unnecessary_brace_in_string_interps, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/infrastructure/db/app_service.dart';
import 'package:drift/drift.dart' as drift;

class CategoryController extends GetxController {
  DBController dbcontroller = Get.find<DBController>();
  TextEditingController ctrl = TextEditingController();
  // AppDB dbcontroller = AppDB();
  var colorIndex = 0.obs;
  var removeIndex = 0.obs;
  var shakeIndex = 0.obs;
  List<IconData> icon = [
    Icons.health_and_safety_outlined,
    Icons.flight,
    Icons.movie,
    Icons.currency_rupee_outlined,
    Icons.home_filled,
    Icons.cast_for_education_outlined,
    Icons.yard,
    Icons.task,
    Icons.work
    // Icons.abc
  ];

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
  List<Color> iconColor = [
    const Color(0xffFFCACB),
    const Color(0xff9BEAAE),
    const Color(0xffE03F6C),
    Colors.yellow,
    const Color(0xffB186FD),
  ];

  List<Color> iconLightColor = [
    const Color.fromARGB(255, 185, 100, 102),
    const Color.fromARGB(255, 83, 164, 102),
    const Color.fromARGB(255, 168, 106, 124),
    const Color.fromARGB(255, 132, 126, 72),
    const Color.fromARGB(255, 136, 113, 176),
  ];

  // List locale = [
  //   {'name': 'English', 'locale': const Locale('en', 'US')},
  //   {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
  //   {'name': 'española', 'locale': const Locale('es', 'ES')},
  //   {'name': 'Português', 'locale': const Locale('pt', 'PT')},
  //   {'name': 'Deutsch', 'locale': const Locale('de', 'DE')},
  //   {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
  //   {'name': 'Français', 'locale': const Locale('fr', 'FR')},
  //   {'name': '한국어', 'locale': const Locale('ko', 'KO')},
  //   {'name': '日本語', 'locale': const Locale('ja', 'JA')},
  // ];

  var category = ''.obs;
  // var color = 0.obs;
  var iconType = 0.obs;

  addCategory() async {
    try {
      var entity = CategoryModelCompanion(
          name: drift.Value(category.value),
          icon: drift.Value(iconType.value),
          color: drift.Value(colorIndex.value));

      var data = await dbcontroller.appDB.insertCategory(entity);
      category.value = '';
      iconType.value = 0;
      colorIndex.value = 0;
      log(data.toString());

      Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  var selectedId = 0.obs;

  updateCategory() async {
    try {
      var entity = CategoryModelCompanion(
          id: drift.Value(selectedId.value),
          name: drift.Value(category.value),
          icon: drift.Value(iconType.value),
          color: drift.Value(colorIndex.value));

      var data = await dbcontroller.appDB.updateCategory(entity);
      category.value = '';
      iconType.value = 0;
      colorIndex.value = 0;
      // print(data);s

      Get.back();
    } catch (e) {
      log('hahaha error up ${e}');
    }
  }

  RxList<CategoryModelData> categories = <CategoryModelData>[].obs;
  getCategory() {
    try {
      dbcontroller.appDB.streamCategories().forEach((element) {
        categories.value = element;
        categories.refresh();
      });
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  deleteCategory(int id) async {
    try {
      await dbcontroller.appDB.deleteCategory(id);
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  double shake(double animation, Curve curve) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());
}
