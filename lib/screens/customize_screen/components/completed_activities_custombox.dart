// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void CompActCustomDialogBox(BuildContext context) {
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
              DescriptionText(text: "Hide completed activites".tr),
              SH.medium(),
              const Divider(
                  // thickness: 1,
                  ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.activitySorting.value = 'Hide';
                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                    text: "Hide".tr,
                    isBold: true,
                    isColor: switchController.activitySorting.value == 'Hide'
                        ? true
                        : false),
              ),
              SH.medium(),
              const Divider(
                  // thickness: 1,
                  ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.activitySorting.value = 'Keep in place';
                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                    text: "Keep in place".tr,
                    isBold: true,
                    isColor: switchController.activitySorting.value ==
                            'Keep in place'
                        ? true
                        : false),
              ),
              SH.medium(),
              const Divider(
                  // thickness: 1,
                  ),
              SH.medium(),
              GestureDetector(
                onTap: () {
                  switchController.activitySorting.value = 'Send to bottom';
                  Get.back();
                },
                behavior: HitTestBehavior.translucent,
                child: LabelText(
                    text: "Send to Bottom".tr,
                    isBold: true,
                    isColor: switchController.activitySorting.value ==
                            'Send to bottom'
                        ? true
                        : false),
              ),
              // SH.medium(),
              // const Divider(
              //     // thickness: ,
              //     ),
              // SH.medium(),
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: const LabelText(
              //     text: "CLOSE",
              //     isBold: true,

              //     // isColor: true,
              //     // color: Color.fromARGB(255, 94, 6, 0),
              //   ),
              // ),
              // SH.medium(),
              // Divider(
              //   thickness: 1,
              // ),
              // SH.medium(),
              // LabelText(
              //   text: "Friday",
              //   // isColor: true,
              // ),
              // SH.medium(),
              // Divider(
              //   thickness: 1,
              // ),
              // SH.medium(),
              // MainLabelText(
              //   text: "Saturday",
              //   // isColor: true,
              // )
            ],
          ),
        );
      });
}
