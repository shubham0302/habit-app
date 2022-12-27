import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/infrastructure/services/category/category_services.dart';
import 'package:drift/drift.dart' as drift;

class CategoryController extends GetxController {
  CategoryClass _categoryDb = CategoryClass();
  var colorIndex = 0.obs;
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
      log(data.toString());

      Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<CategoryModelData> categories = <CategoryModelData>[].obs;
  getCategory() async {
    try {
      categories.value = await _categoryDb.getCategories();
      categories.refresh();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }
  
}
