// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text_large.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';
import 'package:lottie/lottie.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:numberpicker/numberpicker.dart';

void TimeStatusCustomDialogBox(BuildContext context, int index) {
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return StatefulBuilder(builder: ((context, setState) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  backgroundColor: color.backgroundColor,
                  content: Container(
                    // width: 350,
                    // height: 480,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: LabelText(
                              text: "Enter Value".tr,
                              isColor: true,
                            ),
                          ),
                          SH.medium(),
                          Divider(),
                          SH.medium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      DescriptionText(text: "Hours".tr),
                                      SH.small(),
                                      NumberPicker(
                                        // itemCount: 12,
                                        infiniteLoop: true,
                                        value: habbitSelectController
                                            .timeHourStatus.value,
                                        minValue: 0,
                                        maxValue: 12,
                                        itemHeight: 80,
                                        textStyle: TextStyle(
                                            color: color.primaryColor
                                                .withOpacity(0.5),
                                            fontSize: 35,
                                            fontWeight: FontWeight.w200),
                                        selectedTextStyle: TextStyle(
                                            color: color.primaryColor,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400),
                                        onChanged: (value) => setState(() =>
                                            habbitSelectController
                                                .timeHourStatus.value = value),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: color.primaryColor,
                                        fontSize: 50),
                                  ),
                                  Column(
                                    children: [
                                      DescriptionText(text: "Minutes".tr),
                                      SH.small(),
                                      NumberPicker(
                                        // itemCount: 12,
                                        infiniteLoop: true,
                                        value: habbitSelectController
                                            .timeMinStatus.value,
                                        minValue: 0,
                                        maxValue: 60,
                                        itemHeight: 80,
                                        textStyle: TextStyle(
                                            color: color.primaryColor
                                                .withOpacity(0.5),
                                            fontSize: 35,
                                            fontWeight: FontWeight.w200),
                                        selectedTextStyle: TextStyle(
                                            color: color.primaryColor,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400),
                                        onChanged: (value) => setState(() =>
                                            habbitSelectController
                                                .timeMinStatus.value = value),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: color.primaryColor,
                                        fontSize: 50),
                                  ),
                                  Column(
                                    children: [
                                      DescriptionText(text: "Seconds".tr),
                                      SH.small(),
                                      NumberPicker(
                                        // itemCount: 12,
                                        infiniteLoop: true,
                                        value: habbitSelectController
                                            .timeSecStatus.value,
                                        minValue: 0,
                                        maxValue: 60,
                                        itemHeight: 80,
                                        textStyle: TextStyle(
                                            color: color.primaryColor
                                                .withOpacity(0.5),
                                            fontSize: 35,
                                            fontWeight: FontWeight.w200),
                                        selectedTextStyle: TextStyle(
                                            color: color.primaryColor,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400),
                                        onChanged: (value) => setState(() =>
                                            habbitSelectController
                                                .timeSecStatus.value = value),
                                      ),
                                    ],
                                  ),
                                  SH.large(),
                                ],
                              ),
                            ],
                          ),
                          SH.medium(),
                          DescriptionText(text: 'Daily goal'),
                          SH.small(),
                          LabelText(text: 'at Least 00:03'),
                          SH.medium(),
                          const Divider(),
                          SH.medium(),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Center(
                                      child: Container(
                                          child: DescriptionText(
                                              text: 'CLOSE'.tr)),
                                    )),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Center(
                                      child: Container(
                                          child:
                                              DescriptionText(text: 'OK'.tr)),
                                    )),
                              ),
                            ],
                          )
                        ]),
                  ),
                )),
          );
        }));
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });
}
