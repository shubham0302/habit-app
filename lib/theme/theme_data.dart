import 'package:flutter/material.dart';
import 'package:habbit_app/theme/bright_theme.dart';
import 'package:habbit_app/theme/color_scheme.dart';
import 'package:habbit_app/theme/dark_theme.dart';

class Styles {
  static ThemeData themeData(
    BuildContext context,
    bool isDark,
    String mode,
  ) {
    return ThemeData(
      switchTheme: SwitchThemeData(
          
          thumbColor: MaterialStateProperty.all(
            !isDark
                ? ColorSchemeData.themeData[mode]!['primaryColor']
                : ColorSchemeData.darkThemeData[mode]!['primaryColor'],
          ),
          trackColor: MaterialStateProperty.all(
            isDark
                ? ColorSchemeData.defaultBrightColors['secondaryText']
                : ColorSchemeData.defaultDarkColors['secondaryText'],
          )),
      dividerTheme: DividerThemeData(
        thickness: .1,
        color: !isDark
            ? ColorSchemeData.defaultBrightColors['secondaryText']!
                .withOpacity(.5)
            : ColorSchemeData.defaultDarkColors['secondaryText']!
                .withOpacity(.5),
      ),
      iconTheme: IconThemeData(
        size: 15,
        color: isDark
            ? ColorSchemeData.defaultDarkColors['primaryText']
            : ColorSchemeData.defaultBrightColors['primaryText'],
      ),
      textTheme: TextTheme(
        //Heading text
        headline1: TextStyle(
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
          color: !isDark
              ? ColorSchemeData.defaultBrightColors['primaryText']
              : ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //Title Text
        headline2: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: !isDark
              ? ColorSchemeData.defaultBrightColors['primaryText']
              : ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //Description Text
        subtitle1: TextStyle(
          fontSize: 12,
          color: !isDark
              ? ColorSchemeData.defaultBrightColors['secondaryText']
              : ColorSchemeData.defaultDarkColors['secondaryText'],
        ),

        //button Text
        button: TextStyle(
          fontSize: 20,
          color: !isDark
              ? ColorSchemeData.defaultBrightColors['primaryText']
              : ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //Label Text
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: !isDark
              ? ColorSchemeData.defaultBrightColors['primaryText']
              : ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //MainLabel Text
        bodyText2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: !isDark
                ? ColorSchemeData.defaultBrightColors['primaryText']
                : ColorSchemeData.defaultDarkColors['primaryText']),
      ),

      backgroundColor: !isDark
          ? ColorSchemeData.defaultBrightColors['backgroundColor']
          : ColorSchemeData.defaultDarkColors['backgroundColor'],

      indicatorColor: !isDark
          ? ColorSchemeData.themeData[mode]!['primaryColor']
          : ColorSchemeData.darkThemeData[mode]!['primaryColor'],
      primaryColor: !isDark
          ? ColorSchemeData.themeData[mode]!['primaryColor']
          : ColorSchemeData.darkThemeData[mode]!['primaryColor'],

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
