// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void HabbitSortDialogBox(BuildContext context) {
  SwitchController switchController =
      Get.put(SwitchController(), permanent: false);
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DescriptionText(text: "To-do order Sort"),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.habbitSorting.value = 'By priority';
                  switchController.setHabbitSortingData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "By priority",
                  isColor: switchController.habbitSorting.value == 'By priority'
                      ? true
                      : false,
                ),
              ),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.habbitSorting.value = 'By time';
                  switchController.setHabbitSortingData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "By time",
                  isColor: switchController.habbitSorting.value == 'By time'
                      ? true
                      : false,
                ),
              ),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.habbitSorting.value = 'Alphabetical';
                  switchController.setHabbitSortingData();
                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Alphabetical",
                  isColor:
                      switchController.habbitSorting.value == 'Alphabetical'
                          ? true
                          : false,
                ),
              ),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.habbitSorting.value = 'By category';
                  switchController.setHabbitSortingData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "By category",
                  isColor: switchController.habbitSorting.value == 'By category'
                      ? true
                      : false,
                ),
              ),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.habbitSorting.value = 'Tasks first';
                  switchController.setHabbitSortingData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Tasks first",
                  isColor: switchController.habbitSorting.value == 'Tasks first'
                      ? true
                      : false,
                ),
              ),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.habbitSorting.value = 'Habits firsts';
                  switchController.setHabbitSortingData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Habits firsts",
                  isColor:
                      switchController.habbitSorting.value == 'Habits firsts'
                          ? true
                          : false,
                ),
              ),
            ],
          ),
        );
      });
}
