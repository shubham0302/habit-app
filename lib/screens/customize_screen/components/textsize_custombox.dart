// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void TextCustomDialogBox(BuildContext context) {
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
                    DescriptionText(text: "TO-do-list items text size".tr),
                    SH.medium(),
                    const Divider(
                        // thickness: 1,
                        ),
                    SH.medium(),
                    GestureDetector(
                      onTap: () {
                        switchController.textSizing.value = 'Default';
                        Get.back();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: LabelText(
                        text: "Default".tr,
                        isBold: true,
                        isColor: switchController.textSizing.value == 'Default'
                            ? true
                            : false,
                      ),
                    ),
                    SH.medium(),
                    const Divider(
                        // thickness: 1,
                        ),
                    SH.medium(),
                    GestureDetector(
                      onTap: () {
                        switchController.textSizing.value = 'Large';
                        Get.back();
                        print(switchController.textSizing.value);
                      },
                      behavior: HitTestBehavior.translucent,
                      child: LabelText(
                        text: "Large".tr,
                        isBold: true,
                        isColor: switchController.textSizing.value == 'Large'
                            ? true
                            : false,
                      ),
                    ),
                    SH.medium(),
                    const Divider(
                        // thickness: ,
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

  //   return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         DescriptionText(text: "TO-do-list items text size".tr),
  //         SH.medium(),
  //         const Divider(
  //             // thickness: 1,
  //             ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.textSizing.value = 'Default';
  //             Get.back();
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             text: "Default".tr,
  //             isBold: true,
  //             isColor: switchController.textSizing.value == 'Default'
  //                 ? true
  //                 : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //             // thickness: 1,
  //             ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             switchController.textSizing.value = 'Large';
  //             Get.back();
  //             print(switchController.textSizing.value);
  //           },
  //           behavior: HitTestBehavior.translucent,
  //           child: LabelText(
  //             text: "Large".tr,
  //             isBold: true,
  //             isColor: switchController.textSizing.value == 'Large'
  //                 ? true
  //                 : false,
  //           ),
  //         ),
  //         SH.medium(),
  //         const Divider(
  //             // thickness: ,
  //             ),
  //       ],
  //     ),
  //   );
  // });
}
