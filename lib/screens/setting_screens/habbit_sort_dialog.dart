// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void HabbitSortDialogBox(BuildContext context) {
  SwitchController switchController =
      Get.put(SwitchController(), permanent: false);
  ThemeData color = Theme.of(context);

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
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DescriptionText(text: "To-do order Sort".tr),
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
                        text: "By priority".tr,
                        isColor: switchController.habbitSorting.value ==
                                'By priority'
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
                        text: "By time".tr,
                        isColor:
                            switchController.habbitSorting.value == 'By time'
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
                        text: "Alphabetical".tr,
                        isColor: switchController.habbitSorting.value ==
                                'Alphabetical'
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
                        text: "By category".tr,
                        isColor: switchController.habbitSorting.value ==
                                'By category'
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
                        text: "Tasks first".tr,
                        isColor: switchController.habbitSorting.value ==
                                'Tasks first'
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
                        text: "Habits firsts".tr,
                        isColor: switchController.habbitSorting.value ==
                                'Habits firsts'
                            ? true
                            : false,
                      ),
                    ),
                  ],
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
  //     content: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         DescriptionText(text: "To-do order Sort".tr),
  //         SH.medium(),
  //         const Divider(
  //           thickness: 1,
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.habbitSorting.value = 'By priority';
  //             switchController.setHabbitSortingData();

  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             isBold: true,
  //             text: "By priority".tr,
  //             isColor: switchController.habbitSorting.value == 'By priority'
  //                 ? true
  //                 : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //           thickness: 1,
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.habbitSorting.value = 'By time';
  //             switchController.setHabbitSortingData();

  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             isBold: true,
  //             text: "By time".tr,
  //             isColor: switchController.habbitSorting.value == 'By time'
  //                 ? true
  //                 : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //           thickness: 1,
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.habbitSorting.value = 'Alphabetical';
  //             switchController.setHabbitSortingData();
  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             isBold: true,
  //             text: "Alphabetical".tr,
  //             isColor:
  //                 switchController.habbitSorting.value == 'Alphabetical'
  //                     ? true
  //                     : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //           thickness: 1,
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.habbitSorting.value = 'By category';
  //             switchController.setHabbitSortingData();

  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             isBold: true,
  //             text: "By category".tr,
  //             isColor: switchController.habbitSorting.value == 'By category'
  //                 ? true
  //                 : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //           thickness: 1,
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.habbitSorting.value = 'Tasks first';
  //             switchController.setHabbitSortingData();

  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             isBold: true,
  //             text: "Tasks first".tr,
  //             isColor: switchController.habbitSorting.value == 'Tasks first'
  //                 ? true
  //                 : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //           thickness: 1,
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.habbitSorting.value = 'Habits firsts';
  //             switchController.setHabbitSortingData();

  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             isBold: true,
  //             text: "Habits firsts".tr,
  //             isColor:
  //                 switchController.habbitSorting.value == 'Habits firsts'
  //                     ? true
  //                     : false,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // });
}
