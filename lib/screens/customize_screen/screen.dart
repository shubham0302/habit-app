import 'package:flutter/material.dart';
import 'package:habbit_app/screens/customize_screen/components/brightness_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/category_icon_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/free_color_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/header_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/premium_brightness_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/premium_color_customize.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              HeaderCustomize(),
              Divider(),
              BrightnessCustomize(),
              Divider(),
              PrimumBrighnessCustomize(),
              Divider(),
              CategoryIconStyle(),
              Divider(),
              FreeColor(),
              Divider(),
              PremiumColor(),

              // SH.medium(),
            ],
          ),
        ),
      ),
    );
  }
}
