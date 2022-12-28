import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/infrastructure/services/category/category_services.dart';
import 'package:drift/drift.dart' as drift;

class CategoryController extends GetxController {
  TextEditingController ctrl = TextEditingController();
  CategoryClass _categoryDb = CategoryClass();
  var colorIndex = 0.obs;
  var removeIndex = 0.obs;
  var shakeIndex = 0.obs;
  List<IconData> icon = [
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc
    // Icons.abc
  ];
  List<Color> iconColor = [
    Colors.red,
    Colors.red,
    Colors.red,
    Colors.red,
    Colors.red,
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

      var data = await _categoryDb.insertCategory(entity);
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

      var data = await _categoryDb.updateCategory(entity);
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
      _categoryDb.streamCategories().forEach((element) {
        categories.value = element;
        categories.refresh();
      });
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  deleteCategory(int id) async {
    try {
      await _categoryDb.deleteCategory(id);
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  double shake(double animation, Curve curve) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());
}
