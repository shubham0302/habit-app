// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/numeric_custom_dialbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/timer_custom_dialog.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void EvaluateCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddHabbitSelectController addHabbitSelectController =
            Get.put(AddHabbitSelectController(), permanent: false);
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Container(
              width: 280,
              height: 500,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText(
                      text: "How do you want to evaluate your progress ?",
                      isColor: true,
                    ),
                    SH.large(),
                    GestureDetector(
                      onTap: () {
                        addHabbitSelectController.selectEvaluate.value =
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
                          child: const Center(
                            child: LabelText(
                              text: "WITH A YES OR NO",
                              isBold: true,
                              // isColor: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SH.small(),
                    const DescriptionText(
                      text:
                          "If you just want to record whether you succeed with the activity or not",
                      alignment: TextAlign.center,
                    ),
                    SH.large(),
                    GestureDetector(
                      onTap: () {
                        NumericCustomDialogBox(context);
                        addHabbitSelectController.selectEvaluate.value =
                            "NUMERIC";
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.primaryColor),
                          child: const Center(
                            child: LabelText(
                              text: "WITH A NUMERIC VALUE",
                              isBold: true,
                              // isColor: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SH.small(),
                    const DescriptionText(
                      text:
                          "If you want to establish a value as a daily goal or limit for the habit",
                      alignment: TextAlign.center,
                    ),
                    SH.large(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          TimerCustomDialogBox(context);
                          addHabbitSelectController.selectEvaluate.value =
                              "TIMER";
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.primaryColor),
                          child: const Center(
                            child: LabelText(
                              text: "WITH A TIMER",
                              isBold: true,
                              // isColor: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SH.small(),
                    const DescriptionText(
                      text:
                          "If you just want to establish a time value as a daily goal or limit for the habit",
                      alignment: TextAlign.center,
                    ),
                    SH.large(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.primaryColor.withOpacity(0.4)),
                        child: Center(
                          child: LabelText(
                            text: "WITH A CHECKLIST",
                            isBold: true,
                            isColor: true,
                            color: color.canvasColor.withOpacity(0.4),
                            // isColor: true,
                          ),
                        ),
                      ),
                    ),
                    // SH.small(),
                    const Center(
                      child: DescriptionText(
                        text: "Premium feature",
                        isColor: true,
                        alignment: TextAlign.center,
                      ),
                    ),
                    const DescriptionText(
                      text:
                          "If you want to evalute your activity based on a set of sub-items",
                      alignment: TextAlign.center,
                    )
                  ]),
            ));
      });
}
