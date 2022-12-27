// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ReminderRecurringCustomDialogBox(BuildContext context) {
  // TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 30);
  AddRecurringTaskController addRecurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);
  void _showTimePicker() {
    ThemeData color = Theme.of(context);
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
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
      addRecurringTaskController.reminderTime.value = v!;
    });
  }

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
            content: Container(
              width: 280,
              height: 550,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: LabelText(text: "Reminder")),
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
                                text: addRecurringTaskController
                                    .reminderTime.value
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
                            Icon(
                              Icons.notifications_none_outlined,
                              color: color.primaryColor,
                            ),
                            SW.medium(),
                            const LabelText(text: "Reminder type")
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              const LabelText(
                                text: "Drop down",
                              ),
                              SW.medium(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: color.disabledColor.withOpacity(0.3),
                              )
                            ],
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
                    SH.medium(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addRecurringTaskController.alwaysenabled.value =
                                false;
                          },
                          child: Obx(
                            () => Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: color.primaryColor,
                                  border: Border.all(
                                    color: addRecurringTaskController
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
                                    color: addRecurringTaskController
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
                            addRecurringTaskController.alwaysenabled.value =
                                true;
                          },
                          child: Obx(
                            () => Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: color.primaryColor,
                                  border: Border.all(
                                    color: !addRecurringTaskController
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
                                    color: !addRecurringTaskController
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
                      () => addRecurringTaskController.alwaysenabled.value
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('SUN')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('SUN');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("SUN"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("SUN")
                                                            ? color.primaryColor
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
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('MON')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('MON');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("MON"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("MON")
                                                            ? color.primaryColor
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
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('TUS')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('TUS');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("TUS"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("TUS")
                                                            ? color.primaryColor
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
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('WED')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('WED');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("WED"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("WED")
                                                            ? color.primaryColor
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
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('THU')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('THU');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("THU"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("THU")
                                                            ? color.primaryColor
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
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('FRI')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('FRI');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("FRI"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("FRI")
                                                            ? color.primaryColor
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
                                          if (addRecurringTaskController
                                              .customDays
                                              .contains('SAT')) {
                                            addRecurringTaskController
                                                .customDays
                                                .remove('SAT');
                                          } else {
                                            addRecurringTaskController
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
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                                        addRecurringTaskController
                                                            .customDays
                                                            .contains("SAT"),
                                                  ))),
                                                  Container(
                                                    height: 5,
                                                    color:
                                                        addRecurringTaskController
                                                                .customDays
                                                                .contains("SAT")
                                                            ? color.primaryColor
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
                                SH.medium(),
                                const Divider(),
                                SH.medium()
                              ],
                            )
                          : const SizedBox(),
                    ),
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
                            addRecurringTaskController.customSound.value == true
                                ? addRecurringTaskController.customSound.value =
                                    false
                                : addRecurringTaskController.customSound.value =
                                    true;
                            print(addRecurringTaskController.customSound.value);
                          },
                          child: Obx(
                            () => Icon(
                              addRecurringTaskController.customSound.value
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
                            addRecurringTaskController.customVibration.value ==
                                    true
                                ? addRecurringTaskController
                                    .customVibration.value = false
                                : addRecurringTaskController
                                    .customVibration.value = true;
                            print(addRecurringTaskController
                                .customVibration.value);
                          },
                          child: Obx(
                            () => Icon(
                              addRecurringTaskController.customVibration.value
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
                            addRecurringTaskController.customAlarm.value == true
                                ? addRecurringTaskController.customAlarm.value =
                                    false
                                : addRecurringTaskController.customAlarm.value =
                                    true;
                            print(addRecurringTaskController.customAlarm.value);
                          },
                          child: Obx(
                            () => Icon(
                              addRecurringTaskController.customAlarm.value
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: color.primaryColor,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ));
      });
}
