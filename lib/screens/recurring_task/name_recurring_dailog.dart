// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:intl/intl.dart';

void NameRecurringCustomDialogBox(BuildContext context) {
  AddRecurringTaskController addRecurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);
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
                  content: Wrap(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child:
                                    LabelText(text: "Name and description".tr)),
                            SH.large(),
                            const Divider(
                              thickness: 1,
                            ),
                            SH.large(),
                            LabelText(text: "Name".tr),
                            SH.medium(),
                            InputField(
                              hintText: "Name".tr,
                              controller: addRecurringTaskController.nameCtrl,
                              isWhiteHintText: true,
                              onChange: (p0) {
                                addRecurringTaskController.updateName.value =
                                    toBeginningOfSentenceCase(p0).toString();
                              },
                            ),
                            SH.large(),
                            const Divider(
                              thickness: 1,
                            ),
                            SH.large(),
                            LabelText(text: "Description".tr),
                            SH.medium(),
                            InputField(
                              hintText: "Description".tr,
                              controller:
                                  addRecurringTaskController.descriptionCtrl,
                              isWhiteHintText: true,
                              onChange: (p1) {
                                addRecurringTaskController
                                    .updateDescription.value = p1;
                              },
                            ),
                            SH.large(),
                            const Divider(
                              thickness: 1,
                            ),
                            SH.medium(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: MainLabelText(
                                    text: "Add".tr,
                                    isColor: true,
                                    isBold: true,
                                  ),
                                ),
                                SW.large()
                              ],
                            )
                          ]),
                    ],
                  ))),
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
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //       backgroundColor: color.backgroundColor,
  //       content: Wrap(
  //         children: [
  //           Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Center(child: LabelText(text: "Name and description".tr)),
  //                 SH.large(),
  //                 const Divider(
  //                   thickness: 1,
  //                 ),
  //                 SH.large(),
  //                 LabelText(text: "Name".tr),
  //                 SH.medium(),
  //                 InputField(
  //                   hintText: "Name".tr,
  //                   controller: addRecurringTaskController.nameCtrl,
  //                   isWhiteHintText: true,
  //                   onChange: (p0) {
  //                     addRecurringTaskController.updateName.value =
  //                         toBeginningOfSentenceCase(p0).toString();
  //                   },
  //                 ),
  //                 SH.large(),
  //                 const Divider(
  //                   thickness: 1,
  //                 ),
  //                 SH.large(),
  //                 LabelText(text: "Description".tr),
  //                 SH.medium(),
  //                 InputField(
  //                   hintText: "Description".tr,
  //                   controller: addRecurringTaskController.descriptionCtrl,
  //                   isWhiteHintText: true,
  //                   onChange: (p1) {
  //                     addRecurringTaskController.updateDescription.value =
  //                         p1;
  //                   },
  //                 ),
  //                 SH.large(),
  //                 const Divider(
  //                   thickness: 1,
  //                 ),
  //                 SH.medium(),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     GestureDetector(
  //                       onTap: () {
  //                         Get.back();
  //                       },
  //                       child: MainLabelText(
  //                         text: "Add".tr,
  //                         isColor: true,
  //                         isBold: true,
  //                       ),
  //                     ),
  //                     SW.large()
  //                   ],
  //                 )
  //               ]),
  //         ],
  //       ));
  // });
}
