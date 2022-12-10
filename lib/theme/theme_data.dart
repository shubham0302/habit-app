import 'package:flutter/material.dart';
import 'package:habbit_app/theme/bright_theme.dart';
import 'package:habbit_app/theme/color_scheme.dart';
import 'package:habbit_app/theme/dark_theme.dart';

class Styles {
  static ThemeData themeData(BuildContext context,bool isDark, String mode) {
    return ThemeData(

    
      
      // primaryColor: isDark?,

      // primarySwatch:isDark? DarkTheme.primaryColor:BrightTheme.primaryColor,
      // primaryColor: isDark? DarkTheme.primaryColor:BrightTheme.primaryColor,








      // textTheme: Theme.of(context)
      //     .textTheme
      //     .copyWith(: const ColorScheme.light()),
      
      backgroundColor: isDark? DarkTheme.backgroundColor:BrightTheme.backgroundColor,

      indicatorColor: !isDark? ColorSchemeData.themeData[mode]!['primaryColor']:ColorSchemeData.darkThemeData[mode]!['primaryColor'],
      primaryColor: !isDark? ColorSchemeData.themeData[mode]!['primaryColor']:ColorSchemeData.darkThemeData[mode]!['primaryColor'],

      hintColor: Colors.black,

      highlightColor: const Color(0xffFCE192),
      hoverColor: const Color(0xff4285F4),

      focusColor: const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      // textSelectionColor:  Colors.black,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      brightness: Brightness.light,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
