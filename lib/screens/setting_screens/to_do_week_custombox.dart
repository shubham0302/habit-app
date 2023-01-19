// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void ToDoWeekCustomDialogBox(BuildContext context) {
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
              DescriptionText(text: "First day of week".tr),
              SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.dayOfWeek.value = 'Sunday';
                  switchController.setDayOfWeekData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Sunday".tr,
                  isColor: switchController.dayOfWeek.value == 'Sunday'
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
                  switchController.dayOfWeek.value = 'Monday';
                  switchController.setDayOfWeekData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Monday".tr,
                  isColor: switchController.dayOfWeek.value == 'Monday'
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
                  switchController.dayOfWeek.value = 'Tuesday';
                  switchController.setDayOfWeekData();
                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Tuesday".tr,
                  isColor: switchController.dayOfWeek.value == 'Tuesday'
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
                  switchController.dayOfWeek.value = 'Wednesday';
                  switchController.setDayOfWeekData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Wednesday".tr,
                  isColor: switchController.dayOfWeek.value == 'Wednesday'
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
                  switchController.dayOfWeek.value = 'Thursday';
                  switchController.setDayOfWeekData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Thursday".tr,
                  isColor: switchController.dayOfWeek.value == 'Thursday'
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
                  switchController.dayOfWeek.value = 'Friday';
                  switchController.setDayOfWeekData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Friday".tr,
                  isColor: switchController.dayOfWeek.value == 'Friday'
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
                  switchController.dayOfWeek.value = 'Saturday';
                  switchController.setDayOfWeekData();

                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                  isBold: true,
                  text: "Saturday".tr,
                  isColor: switchController.dayOfWeek.value == 'Saturday'
                      ? true
                      : false,
                ),
              ),
            ],
          ),
        );
      });
}
