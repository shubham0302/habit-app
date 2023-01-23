// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/getPremium_dailbox.dart';
import 'package:habbit_app/screens/recurring_task/checklist_dailbox.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void EvaluateRecurringDialogBox(BuildContext context) {
  PremiumController premiumController =
      Get.put(PremiumController(), permanent: false);
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddRecurringTaskController addRecurringTaskController =
            Get.put(AddRecurringTaskController(), permanent: false);
        return AlertDialog(
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
                      LabelText(
                        text: "How do you want to evaluate your progress ?".tr,
                        isColor: true,
                      ),
                      SH.large(),
                      GestureDetector(
                        onTap: () {
                          addRecurringTaskController.selectEvaluate.value =
                              "YES OR NO";
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: color.primaryColor),
                            child: Center(
                              child: LabelText(
                                text: "WITH A YES OR NO".tr,
                                isBold: true,
                                // isColor: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SH.small(),
                      DescriptionText(
                        text:
                            "If you just want to record whether you succeed with the activity or not"
                                .tr,
                        alignment: TextAlign.center,
                      ),

                      SH.large(),
                      premiumController.premium.value == false
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // ChecklistCustomDialogBox(context);
                                      GetPremiumCustomDialogBox(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: color.primaryColor
                                              .withOpacity(0.4)),
                                      child: Center(
                                        child: LabelText(
                                          text: "WITH A CHECKLIST".tr,
                                          isBold: true,
                                          isColor: true,
                                          color: color.canvasColor
                                              .withOpacity(0.4),
                                          // isColor: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: DescriptionText(
                                    text: "Premium feature".tr,
                                    isColor: true,
                                    alignment: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  ChecklistCustomDialogBox(context);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: color.primaryColor),
                                  child: Center(
                                    child: LabelText(
                                      text: "WITH A CHECKLIST".tr,
                                      isBold: true,
                                      isColor: true,
                                      color: color.canvasColor,
                                      // isColor: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      // SH.small(),
                      DescriptionText(
                        text:
                            "If you want to evalute your activity based on a set of sub-items"
                                .tr,
                        alignment: TextAlign.center,
                      )
                    ]),
              ],
            ));
      });
}
