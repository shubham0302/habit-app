import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:path/path.dart';

class ColorSchemeData {
  ThemeController themeController = Get.put(ThemeController(), permanent: true);
  static Map<String, Color> defaultBrightColors = {
    'primaryText': Colors.black,
    'secondaryText': Colors.grey.shade800,
    'backgroundColor': Colors.white,
  };
  static Map<String, Color> defaultDarkColors = {
    'primaryText': Colors.white,
    'secondaryText': Colors.grey,
    'backgroundColor': const Color(0xff151515),
  };
  static Map<String, Map<String, Color>> themeData = {
    'orange': {
      "primaryColor": const Color(0xFFFF9665),
      "lightPrimary": const Color(0xFFFF9665).withOpacity(0.2),
    },
    'green': {
      "primaryColor": const Color(0xFF3E898D),
      "lightPrimary": const Color(0xFF3E898D).withOpacity(0.2),
    },
    'red': {
      "primaryColor": const Color(0xFFB34666),
      "lightPrimary": const Color(0xFFB34666).withOpacity(0.2),
    },
    'purple': {
      "primaryColor": const Color(0xFF533A79),
      "lightPrimary": const Color(0xFF533A79).withOpacity(0.2),
    },
    'yellow': {
      "primaryColor": const Color(0xFFFBFF76),
      "lightPrimary": const Color(0xFFFBFF76).withOpacity(0.5),
    },
  };
  static Map<String, Map<String, Color>> darkThemeData = {
    'orange': {
      "primaryColor": const Color(0xFFFF9665),
      "lightPrimary": const Color(0xFFFF9665).withOpacity(0.2),
    },
    'green': {
      "primaryColor": Colors.lightGreen,
      "lightPrimary": Colors.lightGreen.shade100,
    },
    'red': {
      "primaryColor": const Color(0xFFE03F6C),
      "lightPrimary": const Color(0xFFE03F6C).withOpacity(0.2),
    },
    'purple': {
      "primaryColor": const Color(0xFF533A79),
      "lightPrimary": const Color(0xFF533A79).withOpacity(0.2),
    },
    'yellow': {
      "primaryColor": const Color(0xFFFBFF76),
      "lightPrimary": const Color(0xFFFBFF76).withOpacity(0.5),
    },
  };
}
