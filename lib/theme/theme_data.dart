
import 'package:flutter/material.dart';

 class Styles {
   
  static ThemeData themeData( BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor:  Colors.white,

      backgroundColor: const Color(0xffF1F5FB),

      indicatorColor:  const Color(0xffCBDCF8),
     

      hintColor:  const Color(0xffEECED3),

      highlightColor:  const Color(0xffFCE192),
      hoverColor:  const Color(0xff4285F4),

      focusColor:  const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      // textSelectionColor:  Colors.black,
      cardColor:  Colors.white,
      canvasColor:  Colors.grey[50],
      brightness:Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
    
  }
}