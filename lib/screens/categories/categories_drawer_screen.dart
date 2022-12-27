// ignore_for_file: sized_box_for_whitespace, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/screens/categories/categories.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class CategoriesDrawerScreen extends StatelessWidget {
  const CategoriesDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: GlobalPadding(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (() {
                            Get.back();
                          }),
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: color.primaryColor,
                            ),
                          )),
                      SW.medium(),
                      const MainLabelText(text: 'Categories'),
                    ],
                  ),
                  // Icon(
                  //   Icons.brush,
                  //   size: 20,
                  //   color: color.backgroundColor,
                  // ),
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
        ),
      ),
    );
  }
}
