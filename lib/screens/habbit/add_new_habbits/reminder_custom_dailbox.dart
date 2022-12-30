// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/theme/color_scheme.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ReminderCustomDialogBox(BuildContext context) {
  // TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 30);
  AddTaskController addHabbitSelectController =
      Get.put(AddTaskController(), permanent: false);
  void _showTimePicker() {
    ThemeData color = Theme.of(context);
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: addHabbitSelectController.reminderTime.value.hour,
          minute: addHabbitSelectController.reminderTime.value.minute),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                //  textButtonTheme: ,
                // textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle:)),
                colorScheme: ColorScheme.light(
                    primary: color.primaryColor,
                    onPrimary: color.hintColor,
                    onSurface: color.hintColor,
                    background: color.backgroundColor,
                    onBackground: color.backgroundColor,
                    primaryContainer: color.backgroundColor)),
            child: child!);
      },
    ).then((v) {
      addHabbitSelectController.reminderTime.value = DateTime(
          addHabbitSelectController.date.value.year,
          addHabbitSelectController.date.value.month,
          addHabbitSelectController.date.value.day,
          v!.hour,
          v.minute,
          00);
      // addHabbitSelectController.
    });
  }

  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddTaskController addHabbitSelectController =
            Get.put(AddTaskController(), permanent: false);
        return GlobalPadding(
          child: AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 2),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: color.backgroundColor,
              content: Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(child: LabelText(text: "Reminders")),
                          SH.medium(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.medium(),
                          GestureDetector(
                              onTap: () {
                                _showTimePicker();
                              },
                              child: Center(
                                child: Obx(
                                  () => MainLabelText(
                                      text: TimeOfDay(
                                              hour: addHabbitSelectController
                                                  .reminderTime.value.hour,
                                              minute: addHabbitSelectController
                                                  .reminderTime.value.minute)
                                          .format(context)
                                          .toString()),
                                ),
                              )),
                          const Center(
                            child: LabelText(
                              text: "Reminder time",
                              isColor: true,
                            ),
                          ),
                          SH.medium(),
                          const Divider(),
                          SH.medium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.volume_up_outlined,
                                    size: 20,
                                  ),
                                  SW.medium(),
                                  const LabelText(text: "Sound enabled"),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  addHabbitSelectController.customSound.value ==
                                          true
                                      ? addHabbitSelectController
                                          .customSound.value = false
                                      : addHabbitSelectController
                                          .customSound.value = true;
                                  print(addHabbitSelectController
                                      .customSound.value);
                                },
                                child: Obx(
                                  () => Icon(
                                    addHabbitSelectController.customSound.value
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: color.primaryColor,
                                    size: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SH.medium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.vibration,
                                    size: 20,
                                  ),
                                  SW.medium(),
                                  const LabelText(text: "Vibration enabled"),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  addHabbitSelectController
                                              .customVibration.value ==
                                          true
                                      ? addHabbitSelectController
                                          .customVibration.value = false
                                      : addHabbitSelectController
                                          .customVibration.value = true;
                                  print(addHabbitSelectController
                                      .customVibration.value);
                                },
                                child: Obx(
                                  () => Icon(
                                    addHabbitSelectController
                                            .customVibration.value
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: color.primaryColor,
                                    size: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SH.medium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.alarm_on_rounded,
                                    size: 20,
                                  ),
                                  SW.medium(),
                                  const LabelText(
                                      text: "Enbled for completed activities"),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  addHabbitSelectController.customAlarm.value ==
                                          true
                                      ? addHabbitSelectController
                                          .customAlarm.value = false
                                      : addHabbitSelectController
                                          .customAlarm.value = true;
                                  print(addHabbitSelectController
                                      .customAlarm.value);
                                },
                                child: Obx(
                                  () => Icon(
                                    addHabbitSelectController.customAlarm.value
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: color.primaryColor,
                                    size: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SH.medium(),
                          const Divider(),
                          SH.medium(),
                          const LabelText(
                            text: "Reminder schedule",
                            isColor: true,
                          ),
                          SH.large(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  addHabbitSelectController
                                      .alwaysenabled.value = false;
                                },
                                child: Obx(
                                  () => Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // color: color.primaryColor,
                                        border: Border.all(
                                          color: addHabbitSelectController
                                                  .alwaysenabled.value
                                              ? color.disabledColor
                                              : color.primaryColor,
                                          width: 2,
                                          strokeAlign: StrokeAlign.outside,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: addHabbitSelectController
                                                  .alwaysenabled.value
                                              ? Colors.transparent
                                              : color.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SW.medium(),
                              const LabelText(text: "ALways enabled")
                            ],
                          ),
                          SH.medium(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  addHabbitSelectController
                                      .alwaysenabled.value = true;
                                },
                                child: Obx(
                                  () => Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // color: color.primaryColor,
                                        border: Border.all(
                                          color: !addHabbitSelectController
                                                  .alwaysenabled.value
                                              ? color.disabledColor
                                              : color.primaryColor,
                                          width: 2,
                                          strokeAlign: StrokeAlign.outside,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: !addHabbitSelectController
                                                  .alwaysenabled.value
                                              ? Colors.transparent
                                              : color.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SW.medium(),
                              const LabelText(text: "Custom")
                            ],
                          ),
                          SH.medium(),
                          const Divider(),
                          SH.medium(),
                          Obx(
                            () => addHabbitSelectController.alwaysenabled.value
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('SUN')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('SUN');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('SUN');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "SUN",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "SUN"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "SUN")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('MON')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('MON');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('MON');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "MON",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "MON"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "MON")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('TUS')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('TUS');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('TUS');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "TUS",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "TUS"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "TUS")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('WED')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('WED');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('WED');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "WED",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "WED"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "WED")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('THU')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('THU');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('THU');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "THU",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "THU"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "THU")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('FRI')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('FRI');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('FRI');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "FRI",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "FRI"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "FRI")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (addHabbitSelectController
                                                    .customDays
                                                    .contains('SAT')) {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .remove('SAT');
                                                } else {
                                                  addHabbitSelectController
                                                      .customDays
                                                      .add('SAT');
                                                }
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 60,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(0.1),
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                            child: Center(
                                                                child:
                                                                    DescriptionText(
                                                          text: "SAT",
                                                          isColor:
                                                              addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "SAT"),
                                                        ))),
                                                        Container(
                                                          height: 5,
                                                          color: addHabbitSelectController
                                                                  .customDays
                                                                  .contains(
                                                                      "SAT")
                                                              ? color
                                                                  .primaryColor
                                                              : color
                                                                  .disabledColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                        ]),
                  ),
                ],
              )),
        );
      });
}
