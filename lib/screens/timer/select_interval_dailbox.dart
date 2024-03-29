// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/interval_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:numberpicker/numberpicker.dart';

void SelectInterTimeCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  IntervalTabController intervalTabController =
      Get.put(IntervalTabController(), permanent: false);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: StatefulBuilder(
                builder: (context, setState) => AlertDialog(
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
                              text: "Add interval".tr,
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
                                      value: intervalTabController
                                          .currentvalueHour.value,
                                      minValue: 0,
                                      maxValue: 12,
                                      itemHeight: 50,
                                      textStyle: TextStyle(
                                          color: color.primaryColor
                                              .withOpacity(0.5),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200),
                                      selectedTextStyle: TextStyle(
                                          color: color.primaryColor,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400),
                                      onChanged: (value) => setState(() =>
                                          intervalTabController
                                              .currentvalueHour.value = value),
                                    ),
                                    SH.medium(),
                                    DescriptionText(text: 'Hours'.tr)
                                  ],
                                ),
                                Column(
                                  children: [
                                    NumberPicker(
                                      // itemCount: 12,
                                      infiniteLoop: true,
                                      value: intervalTabController
                                          .currentvalueMin.value,
                                      minValue: 0,
                                      maxValue: 60,
                                      itemHeight: 50,
                                      textStyle: TextStyle(
                                          color: color.primaryColor
                                              .withOpacity(0.5),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200),
                                      selectedTextStyle: TextStyle(
                                          color: color.primaryColor,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400),
                                      onChanged: (value) => setState(() =>
                                          intervalTabController
                                              .currentvalueMin.value = value),
                                    ),
                                    SH.medium(),
                                    DescriptionText(text: 'Minutes'.tr)
                                  ],
                                ),
                                Column(
                                  children: [
                                    NumberPicker(
                                      // itemCount: 12,
                                      infiniteLoop: true,
                                      value: intervalTabController
                                          .currentvalueSec.value,
                                      minValue: 0,
                                      maxValue: 60,
                                      itemHeight: 50,
                                      textStyle: TextStyle(
                                          color: color.primaryColor
                                              .withOpacity(0.5),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200),
                                      selectedTextStyle: TextStyle(
                                          color: color.primaryColor,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400),
                                      onChanged: (value) => setState(() =>
                                          intervalTabController
                                              .currentvalueSec.value = value),
                                    ),
                                    SH.medium(),
                                    DescriptionText(text: 'Secounds'.tr)
                                  ],
                                ),
                              ],
                            ),
                            SH.large(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LabelText(
                                  text: 'Break'.tr,
                                ),
                                Obx(
                                  () => FlutterSwitch(
                                    activeColor: color.primaryColor,
                                    activeToggleColor: color.backgroundColor,

                                    width: 50.0,
                                    height: 25.0,
                                    valueFontSize: 15.0,
                                    toggleSize: 20.0,
                                    value:
                                        intervalTabController.breakSwitch.value,
                                    borderRadius: 30.0,
                                    padding: 2.0,
                                    // showOnOff: true,
                                    onToggle: (val) {
                                      intervalTabController.breakSwitch.value ==
                                              true
                                          ? intervalTabController
                                              .breakSwitch.value = false
                                          : intervalTabController
                                              .breakSwitch.value = true;
                                      // status = val;
                                      // setState(() {
                                      //   status = val;
                                      // });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SH.large(),
                            const Divider(),
                            SH.large(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: LabelText(
                                      text: 'CLOSE'.tr,
                                      isBold: true,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      intervalTabController.addInterval(
                                          intervalTabController
                                              .currentvalueHour.value,
                                          intervalTabController
                                              .currentvalueMin.value,
                                          intervalTabController
                                              .currentvalueSec.value,
                                          intervalTabController
                                              .breakSwitch.value);
                                      Get.back();
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: LabelText(
                                        text: 'OK'.tr,
                                        isBold: true,
                                        isColor: true,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ]),
                    )),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //   return StatefulBuilder(
  //     builder: (context, setState) => AlertDialog(
  //         insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //         shape: const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //         backgroundColor: color.backgroundColor,
  //         content: Container(
  //           // width: 300,
  //           // height: 180,
  //           child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Center(
  //                     child: LabelText(
  //                   text: "Add interval".tr,
  //                   isColor: true,
  //                   color: color.disabledColor,
  //                 )),
  //                 SH.medium(),
  //                 const Divider(),
  //                 SH.medium(),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Column(
  //                       children: [
  //                         NumberPicker(
  //                           // itemCount: 12,
  //                           infiniteLoop: true,
  //                           value: intervalTabController
  //                               .currentvalueHour.value,
  //                           minValue: 0,
  //                           maxValue: 12,
  //                           itemHeight: 50,
  //                           textStyle: TextStyle(
  //                               color: color.primaryColor.withOpacity(0.5),
  //                               fontSize: 25,
  //                               fontWeight: FontWeight.w200),
  //                           selectedTextStyle: TextStyle(
  //                               color: color.primaryColor,
  //                               fontSize: 40,
  //                               fontWeight: FontWeight.w400),
  //                           onChanged: (value) => setState(() =>
  //                               intervalTabController
  //                                   .currentvalueHour.value = value),
  //                         ),
  //                         SH.medium(),
  //                         DescriptionText(text: 'Hours'.tr)
  //                       ],
  //                     ),
  //                     Column(
  //                       children: [
  //                         NumberPicker(
  //                           // itemCount: 12,
  //                           infiniteLoop: true,
  //                           value:
  //                               intervalTabController.currentvalueMin.value,
  //                           minValue: 0,
  //                           maxValue: 60,
  //                           itemHeight: 50,
  //                           textStyle: TextStyle(
  //                               color: color.primaryColor.withOpacity(0.5),
  //                               fontSize: 25,
  //                               fontWeight: FontWeight.w200),
  //                           selectedTextStyle: TextStyle(
  //                               color: color.primaryColor,
  //                               fontSize: 40,
  //                               fontWeight: FontWeight.w400),
  //                           onChanged: (value) => setState(() =>
  //                               intervalTabController
  //                                   .currentvalueMin.value = value),
  //                         ),
  //                         SH.medium(),
  //                         DescriptionText(text: 'Minutes'.tr)
  //                       ],
  //                     ),
  //                     Column(
  //                       children: [
  //                         NumberPicker(
  //                           // itemCount: 12,
  //                           infiniteLoop: true,
  //                           value:
  //                               intervalTabController.currentvalueSec.value,
  //                           minValue: 0,
  //                           maxValue: 60,
  //                           itemHeight: 50,
  //                           textStyle: TextStyle(
  //                               color: color.primaryColor.withOpacity(0.5),
  //                               fontSize: 25,
  //                               fontWeight: FontWeight.w200),
  //                           selectedTextStyle: TextStyle(
  //                               color: color.primaryColor,
  //                               fontSize: 40,
  //                               fontWeight: FontWeight.w400),
  //                           onChanged: (value) => setState(() =>
  //                               intervalTabController
  //                                   .currentvalueSec.value = value),
  //                         ),
  //                         SH.medium(),
  //                         DescriptionText(text: 'Secounds'.tr)
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 SH.large(),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     LabelText(
  //                       text: 'Break'.tr,
  //                     ),
  //                     Obx(
  //                       () => FlutterSwitch(
  //                         activeColor: color.primaryColor,
  //                         activeToggleColor: color.backgroundColor,

  //                         width: 50.0,
  //                         height: 25.0,
  //                         valueFontSize: 15.0,
  //                         toggleSize: 20.0,
  //                         value: intervalTabController.breakSwitch.value,
  //                         borderRadius: 30.0,
  //                         padding: 2.0,
  //                         // showOnOff: true,
  //                         onToggle: (val) {
  //                           intervalTabController.breakSwitch.value == true
  //                               ? intervalTabController.breakSwitch.value =
  //                                   false
  //                               : intervalTabController.breakSwitch.value =
  //                                   true;
  //                           // status = val;
  //                           // setState(() {
  //                           //   status = val;
  //                           // });
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SH.large(),
  //                 const Divider(),
  //                 SH.large(),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     LabelText(
  //                       text: 'CLOSE'.tr,
  //                       isBold: true,
  //                     ),
  //                     GestureDetector(
  //                       onTap: () {
  //                         intervalTabController.addInterval(
  //                             intervalTabController.currentvalueHour.value,
  //                             intervalTabController.currentvalueMin.value,
  //                             intervalTabController.currentvalueSec.value,
  //                             intervalTabController.breakSwitch.value);
  //                         Get.back();
  //                       },
  //                       behavior: HitTestBehavior.translucent,
  //                       child: LabelText(
  //                         text: 'OK'.tr,
  //                         isBold: true,
  //                         isColor: true,
  //                       ),
  //                     )
  //                   ],
  //                 )
  //               ]),
  //         )),
  //   );
  // });
}
