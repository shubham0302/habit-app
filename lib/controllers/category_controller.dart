import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/infrastructure/db/app_service.dart';
import 'package:drift/drift.dart' as drift;

class CategoryController extends GetxController {
  DBController dbcontroller = Get.find<DBController>() ;
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
  List<Color> iconColor = [
    Color(0xffFFCACB),
    Color(0xff9BEAAE),
    Color(0xffE03F6C),
    Color(0xffFBFF76),
    Color(0xffB186FD),
  ];

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
