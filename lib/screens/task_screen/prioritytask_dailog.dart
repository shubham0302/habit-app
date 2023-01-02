// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, file_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void PriorityTaskCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddTaskController addHabbitSelectController =
            Get.put(AddTaskController(), permanent: false);
        return AlertDialog(
          // insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 340,
            height: 320,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MainLabelText(text: "Seletct a Priority"),
                  SH.large(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 100,

                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updatePriority.value =
                                  9;
                              Get.back();
                            },
                            child: Container(
                              height: 60,
                              // width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: color.disabledColor
                                          .withOpacity(0.4))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const LabelText(text: "9"),
                                    SW.small(),
                                    addHabbitSelectController
                                                .updatePriority.value ==
                                            "9"
                                        ? const Icon(
                                            Icons.flag_rounded,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.flag_outlined,
                                            size: 20,
                                            color: color.primaryColor,
                                          ),
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updatePriority.value =
                                  8;
                              Get.back();
                            },
                            child: Container(
                              height: 60,
                              // width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: color.disabledColor
                                          .withOpacity(0.4))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const LabelText(text: "8"),
                                    SW.small(),
                                    addHabbitSelectController
                                                .updatePriority.value ==
                                            "8"
                                        ? const Icon(
                                            Icons.flag_rounded,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.flag_outlined,
                                            size: 20,
                                            color: color.primaryColor,
                                          ),
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              addHabbitSelectController.updatePriority.value =
                                  7;
                              Get.back();
                            },
                            child: Container(
                              height: 60,
                              // width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: color.disabledColor
                                          .withOpacity(0.4))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const LabelText(text: "7"),
                                    SW.small(),
                                    addHabbitSelectController
                                                .updatePriority.value ==
                                            "7"
                                        ? const Icon(
                                            Icons.flag_rounded,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.flag_outlined,
                                            size: 20,
                                            color: color.primaryColor,
                                          ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addHabbitSelectController.updatePriority.value = 6;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            // width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LabelText(text: "6"),
                                  SW.small(),
                                  addHabbitSelectController
                                              .updatePriority.value ==
                                          "6"
                                      ? const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.flag_outlined,
                                          size: 20,
                                          color: color.primaryColor,
                                        ),
                                ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addHabbitSelectController.updatePriority.value = 5;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            // width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LabelText(text: "5"),
                                  SW.small(),
                                  addHabbitSelectController
                                              .updatePriority.value ==
                                          "5"
                                      ? const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.flag_outlined,
                                          size: 20,
                                          color: color.primaryColor,
                                        ),
                                ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addHabbitSelectController.updatePriority.value = 4;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            // width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LabelText(text: "4"),
                                  SW.small(),
                                  addHabbitSelectController
                                              .updatePriority.value ==
                                          "4"
                                      ? const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.flag_outlined,
                                          size: 20,
                                          color: color.primaryColor,
                                        ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addHabbitSelectController.updatePriority.value = 3;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LabelText(text: "3"),
                                  SW.small(),
                                  addHabbitSelectController
                                              .updatePriority.value ==
                                          "3"
                                      ? const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.flag_outlined,
                                          size: 20,
                                          color: color.primaryColor,
                                        ),
                                ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addHabbitSelectController.updatePriority.value = 2;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            // width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LabelText(text: "2"),
                                  SW.small(),
                                  addHabbitSelectController
                                              .updatePriority.value ==
                                          "2"
                                      ? const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.flag_outlined,
                                          size: 20,
                                          color: color.primaryColor,
                                        ),
                                ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addHabbitSelectController.updatePriority.value = 1;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            // width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.4))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LabelText(text: "1"),
                                  SW.small(),
                                  addHabbitSelectController
                                              .updatePriority.value ==
                                          "1"
                                      ? const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.flag_outlined,
                                          size: 20,
                                          color: color.primaryColor,
                                        ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updatePriority.value = 0;
                          Get.back();
                        },
                        child: Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const LabelText(text: "0"),
                                    SW.small(),
                                    addHabbitSelectController
                                                .updatePriority.value ==
                                            "0"
                                        ? const Icon(
                                            Icons.flag_rounded,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.flag_outlined,
                                            size: 20,
                                            color: color.primaryColor,
                                          ),
                                  ]),
                              const LabelText(text: "Default")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SH.large(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const LabelText(
                      text: "Close",
                      isColor: true,
                    ),
                  )
                ]),
          ),
        );
      });
}
