// ignore_for_file: sized_box_for_whitespace, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/screens/customize_screen/categories/categories.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class CategoriesDrawerScreen extends StatelessWidget {
  const CategoriesDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: color.primaryColor,
                    size: 20,
                  ),
                ),
                SW.medium(),
                const HeadingText(text: "Categories"),
              ],
            ),
            SH.large(),
            SH.large(),
            Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: const CategoriesScreen()),
            SH.medium(),
            SH.large(),
          ],
        ),
      )),
    );
  }
}
