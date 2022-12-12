import 'package:flutter/material.dart';

class ColorSchemeData {
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
    'red': {
      "primaryColor": Colors.red,
      "lightPrimary": Colors.red.shade100,
    },
    'green': {
      "primaryColor": Colors.green,
      "lightPrimary": Colors.green.shade100,
    },
    'blue': {
      "primaryColor": Colors.blue,
      "lightPrimary": Colors.blue.shade100,
    },
    'purple': {
      "primaryColor": Colors.purple,
      "lightPrimary": Colors.purple.shade100,
    },
  };
  static Map<String, Map<String, Color>> darkThemeData = {
    'red': {
      "primaryColor": Colors.orange,
      "lightPrimary": Colors.orange.shade100,
    },
    'green': {
      "primaryColor": Colors.lightGreen,
      "lightPrimary": Colors.lightGreen.shade100,
    },
    'blue': {
      "primaryColor": Colors.lightBlue,
      "lightPrimary": Colors.lightBlue.shade100,
    },
    'purple': {
      "primaryColor": Colors.pink,
      "lightPrimary": Colors.pink.shade100,
    },
  };
}
