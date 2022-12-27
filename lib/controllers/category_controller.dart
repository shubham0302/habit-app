import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
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
}
