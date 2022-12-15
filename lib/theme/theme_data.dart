import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habbit_app/theme/color_scheme.dart';

class Styles {
  static ThemeData themeData(
    BuildContext context,
    String mode,
  ) {
    return ThemeData(
      splashColor: ColorSchemeData.themeData[mode]!['primaryColor'],
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(
            ColorSchemeData.themeData[mode]!['primaryColor'],
          ),
          trackColor: MaterialStateProperty.all(
            ColorSchemeData.defaultBrightColors['secondaryText'],
          )),
      dividerTheme: DividerThemeData(
        thickness: .1,
        color: ColorSchemeData.defaultBrightColors['secondaryText']!
            .withOpacity(.5),
      ),
      iconTheme: IconThemeData(
        size: 15,
        color: ColorSchemeData.defaultBrightColors['primaryText'],
      ),
      textTheme: TextTheme(
        //Heading text
        headline1: TextStyle(
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
          color: ColorSchemeData.defaultBrightColors['primaryText'],
        ),

        //Title Text
        headline2: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: ColorSchemeData.defaultBrightColors['primaryText'],
        ),

        //Description Text
        subtitle1: TextStyle(
          fontSize: 12,
          color: ColorSchemeData.defaultBrightColors['secondaryText'],
        ),

        //button Text
        button: TextStyle(
          fontSize: 20,
          color: ColorSchemeData.defaultBrightColors['primaryText'],
        ),

        //Label Text
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: ColorSchemeData.defaultBrightColors['primaryText'],
        ),

        //MainLabel Text
        bodyText2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: ColorSchemeData.defaultBrightColors['primaryText'],
        ),
      ),

      backgroundColor: ColorSchemeData.defaultBrightColors['backgroundColor'],
      scaffoldBackgroundColor:
          ColorSchemeData.defaultBrightColors['backgroundColor'],

      indicatorColor: ColorSchemeData.themeData[mode]!['primaryColor'],

      primaryColor: ColorSchemeData.themeData[mode]!['primaryColor'],
      primaryColorDark: ColorSchemeData.defaultBrightColors['primaryText'],
      hintColor: Colors.black,

      highlightColor: const Color(0xffFCE192),
      hoverColor: const Color(0xff4285F4),

      focusColor: const Color(0xffA8DAB5),
      disabledColor: Colors.grey.shade600,
      // textSelectionColor:  Colors.black,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      brightness: Brightness.light,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }

  static ThemeData darkThemeData(
    BuildContext context,
    String mode,
  ) {
    return ThemeData(
      splashColor: ColorSchemeData.themeData[mode]!['primaryColor'],

      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(
            ColorSchemeData.darkThemeData[mode]!['primaryColor'],
          ),
          trackColor: MaterialStateProperty.all(
            ColorSchemeData.defaultDarkColors['secondaryText'],
          )),
      dividerTheme: DividerThemeData(
        thickness: .1,
        color:
            ColorSchemeData.defaultDarkColors['secondaryText']!.withOpacity(.5),
      ),
      iconTheme: IconThemeData(
        size: 15,
        color: ColorSchemeData.defaultBrightColors['primaryText'],
      ),
      textTheme: TextTheme(
        //Heading text
        headline1: TextStyle(
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
          color: ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //Title Text
        headline2: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //Description Text
        subtitle1: TextStyle(
          fontSize: 12,
          color: ColorSchemeData.defaultDarkColors['secondaryText'],
        ),

        //button Text
        button: TextStyle(
          fontSize: 20,
          color: ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //Label Text
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: ColorSchemeData.defaultDarkColors['primaryText'],
        ),

        //MainLabel Text
        bodyText2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: ColorSchemeData.defaultDarkColors['primaryText']),
      ),
      primaryColorDark: ColorSchemeData.defaultDarkColors['primaryText'],

      backgroundColor: ColorSchemeData.defaultDarkColors['backgroundColor'],
      scaffoldBackgroundColor:
          ColorSchemeData.defaultDarkColors['backgroundColor'],

      indicatorColor: ColorSchemeData.darkThemeData[mode]!['primaryColor'],
      primaryColor: ColorSchemeData.darkThemeData[mode]!['primaryColor'],

      hintColor: Colors.black,

      highlightColor: const Color(0xffFCE192),
      hoverColor: const Color(0xff4285F4),

      focusColor: const Color(0xffA8DAB5),
      disabledColor: Colors.grey.shade500,
      // textSelectionColor:  Colors.black,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      brightness: Brightness.dark,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}
