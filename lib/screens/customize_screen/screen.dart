import 'package:flutter/material.dart';
import 'package:habbit_app/screens/customize_screen/components/brightness_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/header_customize.dart';
import 'package:habbit_app/screens/customize_screen/components/premium_brightness_customize.dart';
import 'package:habbit_app/widgets/sized_box.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SH.large(),
          SH.large(),
          const HeaderCustomize(),
          const Divider(),
          const BrightnessCustomize(),
          const Divider(),
          // const PrimumBrighnessCustomize(),
          // SH.medium(),
        ],
      ),
    );
  }
}
