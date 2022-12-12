// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ThemeConfig {
// Colors

  static const primaryColor = Color(0xff4e7d96);
  static const primaryColorLite = Color(0xff9fc9dd);
  static const backgroundColor = Color(0xffe3edf2);
  static const whiteColor = Colors.white;
  static const mainTextColor = Color(0xff0a0d25);
  static const secondaryColor = Color(0xffff844b);
  // static const secondaryColorLite = Color.fromARGB(255, 193, 223, 198);
  // static const descriptionColor = Colors.grey;
  // static const buttonOutlineColor = primaryColor;
  // static const greyColor = const Color(0xffF4F5F7);
  // static const borderColor = Color(0xffEBECF0);
  static const redColor = Colors.red;

  //Text size
  static const headingSize = 25.0;
  static const titleSize = 20.0;
  static const subtitleSize = 15.0;
  static const descriptionSize = 13.0;

  static const smallTextSize = 8.0;
  static const mainLabelSize = 15.0;
  static const labelSize = 10.0;
  static const buttonSize = 15.0;

  static const searchBarSize = 20.0;
  static const bannerHeadingSize = 20.0;
  static const bannerLabelSize = 20.0;
  static const priceSize = 20.0;

  static const radiusMax = 30.0;
  static const radiusMid = 20.0;
  static const radiusMin = 10.0;
  static const smallRadius = 5.0;

  // padding

  static const screenPadding = EdgeInsets.all(10);
  static const contentPadding = EdgeInsets.all(5);
  static const contentPadding2 = EdgeInsets.all(10);

  // screen size
  static const maxScreenSize = 500.0;

  // media query height& size

  static MaterialColor getStatusColor(int s) {
    var color;

    switch (s) {
      case 4:
        color = Colors.red;
        break;
      case 2:
        color = Colors.yellow;
        break;
      case 3:
        color = Colors.orange;
        break;
      case 1:
        color = Colors.green;
        break;
      default:
        color = Colors.green;
    }
    return color;
  }
}
