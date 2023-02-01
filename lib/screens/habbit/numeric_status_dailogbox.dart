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

void NumericStatusCustomDialogBox(BuildContext context, int index) {
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
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
                content: Container(
                  width: 250,
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
                            Container(
                              // color: color.primaryColor,
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: color.primaryColor),
                              child: Row(children: [
                                SW.small(),
                                GestureDetector(
                                  onTap: () {
                                    habbitSelectController.subNumaric();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: color.backgroundColor,
                                  ),
                                ),
                                SW.small(),
                                Expanded(
                                    child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  color: color.backgroundColor.withOpacity(0.4),
                                  child: Center(
                                      child: Obx(
                                    () => LabelTextLarge(
                                      text: habbitSelectController
                                          .numaricStatus.value
                                          .toString(),
                                    ),
                                  )),
                                )),
                                SW.small(),
                                GestureDetector(
                                  onTap: () {
                                    habbitSelectController.addNumaric();
                                    print(habbitSelectController
                                        .numaricStatus.value);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                    color: color.backgroundColor,
                                  ),
                                ),
                                SW.small(),
                              ]),
                            )
                          ],
                        ),
                        SH.medium(),
                        DescriptionText(text: 'Daily goal'),
                        SH.small(),
                        // LabelText(text: 'Less than 20.0 ${habbitSelectController.tasks[index].}'),
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
                                        child:
                                            DescriptionText(text: 'CLOSE'.tr)),
                                  )),
                            ),
                            Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          child:
                                              DescriptionText(text: 'OK'.tr)),
                                    ),
                                  )),
                            ),
                          ],
                        )
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
}
