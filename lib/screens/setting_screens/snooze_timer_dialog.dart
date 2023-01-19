// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/time_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:numberpicker/numberpicker.dart';

void snoozeTimeDialog(BuildContext context) {
  ThemeData color = Theme.of(context);
  NotifyTimeController notifyTimeController =
      Get.put(NotifyTimeController(), permanent: false);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 2),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: color.backgroundColor,
              content: Container(
                // width: 300,
                // height: 180,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: LabelText(
                        text: "Add interval",
                        isColor: true,
                        color: color.disabledColor,
                      )),
                      SH.medium(),
                      const Divider(),
                      SH.medium(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              NumberPicker(
                                  // itemCount: 12,
                                  infiniteLoop: true,
                                  value: notifyTimeController.minute.value,
                                  minValue: 0,
                                  maxValue: 60,
                                  itemHeight: 50,
                                  textStyle: TextStyle(
                                      color:
                                          color.primaryColor.withOpacity(0.5),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200),
                                  selectedTextStyle: TextStyle(
                                      color: color.primaryColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w400),
                                  onChanged: (value) {
                                    notifyTimeController.minute.value = value;
                                    notifyTimeController.setMinuteData();
                                  }),
                              SH.medium(),
                              DescriptionText(text: 'Minutes'.tr)
                            ],
                          ),
                        ],
                      ),
                      SH.large(),
                      const Divider(),
                      SH.large(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            behavior: HitTestBehavior.translucent,
                            child: LabelText(
                              text: 'CLOSE'.tr,
                              isBold: true,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            behavior: HitTestBehavior.translucent,
                            child: LabelText(
                              text: 'OK'.tr,
                              isBold: true,
                              isColor: true,
                            ),
                          )
                        ],
                      )
                    ]),
              )),
        );
      });
}
