// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void RepetationTaskCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);

  AddHabbitSelectController addHabbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
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
                  width: 360,
                  height: 480,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MainLabelText(
                            text: "How often do you want to do it?".tr),
                        SH.large(),
                        const Divider(
                          thickness: 1,
                        ),
                        SH.large(),
                        GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updateRepetation.value =
                                  "Everyday";
                              Get.back();
                            },
                            child: LabelText(text: "Everyday".tr)),
                        SH.large(),
                        const Divider(
                          thickness: 1,
                        ),
                        SH.large(),
                        GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updateRepetation.value =
                                  "Some days of the week";
                              Get.back();
                            },
                            child: LabelText(text: "Some days of the week".tr)),
                        SH.large(),
                        const Divider(
                          thickness: 1,
                        ),
                        SH.large(),
                        GestureDetector(
                            onDoubleTap: () {
                              addHabbitSelectController.updateRepetation.value =
                                  "Specific days of the month";
                              Get.back();
                            },
                            child: LabelText(
                                text: "Specific days of the month".tr)),
                        SH.large(),
                        const Divider(
                          thickness: 1,
                        ),
                        SH.large(),
                        GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updateRepetation.value =
                                  "Specific days of the year";
                              Get.back();
                            },
                            child: LabelText(
                                text: "Specific days of the year".tr)),
                        SH.large(),
                        const Divider(
                          thickness: 1,
                        ),
                        SH.large(),
                        GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updateRepetation.value =
                                  "Some time per period";
                              Get.back();
                            },
                            child: LabelText(text: "Some time per period".tr)),
                        SH.large(),
                        const Divider(
                          thickness: 1,
                        ),
                        SH.large(),
                        GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updateRepetation.value =
                                  "Repeat";
                              Get.back();
                            },
                            child: LabelText(text: "Repeat".tr)),
                        SH.large(),
                      ]),
                ),
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

  //   return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Container(
  //       width: 360,
  //       height: 480,
  //       child: Column(mainAxisAlignment: MainAxisAlignment.start,
  //           // crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             MainLabelText(text: "How often do you want to do it?".tr),
  //             SH.large(),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             SH.large(),
  //             GestureDetector(
  //                 onTap: () {
  //                   addHabbitSelectController.updateRepetation.value =
  //                       "Everyday";
  //                   Get.back();
  //                 },
  //                 child: LabelText(text: "Everyday".tr)),
  //             SH.large(),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             SH.large(),
  //             GestureDetector(
  //                 onTap: () {
  //                   addHabbitSelectController.updateRepetation.value =
  //                       "Some days of the week";
  //                   Get.back();
  //                 },
  //                 child: LabelText(text: "Some days of the week".tr)),
  //             SH.large(),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             SH.large(),
  //             GestureDetector(
  //                 onDoubleTap: () {
  //                   addHabbitSelectController.updateRepetation.value =
  //                       "Specific days of the month";
  //                   Get.back();
  //                 },
  //                 child: LabelText(text: "Specific days of the month".tr)),
  //             SH.large(),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             SH.large(),
  //             GestureDetector(
  //                 onTap: () {
  //                   addHabbitSelectController.updateRepetation.value =
  //                       "Specific days of the year";
  //                   Get.back();
  //                 },
  //                 child: LabelText(text: "Specific days of the year".tr)),
  //             SH.large(),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             SH.large(),
  //             GestureDetector(
  //                 onTap: () {
  //                   addHabbitSelectController.updateRepetation.value =
  //                       "Some time per period";
  //                   Get.back();
  //                 },
  //                 child: LabelText(text: "Some time per period".tr)),
  //             SH.large(),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             SH.large(),
  //             GestureDetector(
  //                 onTap: () {
  //                   addHabbitSelectController.updateRepetation.value =
  //                       "Repeat";
  //                   Get.back();
  //                 },
  //                 child: LabelText(text: "Repeat".tr)),
  //             SH.large(),
  //           ]),
  //     ),
  //   );
  // });
}
