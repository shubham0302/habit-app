// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/timer/timer_screen.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text_large.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';

import '../../widgets/icon_widget.dart';
import '../habbit/checklsit_status.dart';
import '../habbit/numeric_status_dailogbox.dart';
import '../habbit/time_status.dart';

void HabitTimerCustomDialogBox(BuildContext context, int index) {
  TimerTabController timerTabController =
      Get.put(TimerTabController(), permanent: false);
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: color.primaryColor,
                                ),
                                SW.small(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        text: habbitSelectController
                                            .tasks[index].habitName),
                                    DescriptionText(
                                        text: habbitSelectController
                                            .tasks[index].endDate
                                            .toIso8601String())
                                  ],
                                ),
                              ],
                            ),
                            Obx(() => IconWidgetClassic(
                                  icon: categoryController.icon[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              habbitSelectController
                                                  .tasks[index].categoryId)
                                          .icon],
                                  contanerColor: color.brightness ==
                                          Brightness.dark
                                      ? categoryController.iconColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  habbitSelectController
                                                      .tasks[index].categoryId)
                                              .color]
                                      : categoryController.iconLightColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  habbitSelectController
                                                      .tasks[index].categoryId)
                                              .color],
                                ))
                          ],
                        ),
                        SH.medium(),
                        const Divider(),

// Time
                        habbitSelectController.tasks[index].evaluate == 'Timer'
                            ? Column(
                                children: [
                                  SH.large(),
                                  LabelTextLarge(
                                      text:
                                          '${timerTabController.stopWatchHour.value}:${timerTabController.stopWatchMin.value}:${timerTabController.stopWatchSec.value}'),
                                  SH.small(),
                                  const DescriptionText(text: 'Total Time'),
                                  SH.large(),
                                  const Divider(),
                                  const DescriptionText(text: 'Current Time'),
                                  SH.small(),
                                  const LabelText(
                                    text: '00:00',
                                    isColor: true,
                                  ),
                                  const Divider(),
                                  SH.medium(),
                                  GestureDetector(
                                    onTap: () {
                                      TimeStatusCustomDialogBox(context, index);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          size: 20,
                                          color: color.disabledColor,
                                        ),
                                        SW.medium(),
                                        const DescriptionText(
                                            text: 'Save time records')
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : habbitSelectController.tasks[index].evaluate ==
                                    'Numeric'
                                ?

//Nuimaric
                                Column(
                                    children: [
                                      SH.large(),
                                      const LabelTextLarge(text: '00:00'),
                                      SH.small(),
                                      const DescriptionText(text: 'Total Time'),
                                      SH.large(),
                                      const Divider(),
                                      const DescriptionText(text: 'Current'),
                                      SH.small(),
                                      const LabelText(
                                        text: '0 smoke',
                                        isColor: true,
                                      ),
                                      const Divider(),
                                      SH.medium(),
                                      GestureDetector(
                                        onTap: () {
                                          NumericStatusCustomDialogBox(
                                              context, index);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.alarm,
                                              size: 20,
                                              color: color.disabledColor,
                                            ),
                                            SW.medium(),
                                            const DescriptionText(
                                                text: 'Enter value manuually')
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
// Checklist
                                : habbitSelectController
                                            .tasks[index].evaluate ==
                                        'Checklist'
                                    ? Column(
                                        children: [
                                          SH.large(),
                                          const LabelTextLarge(text: '00:00'),
                                          SH.small(),
                                          const DescriptionText(
                                              text: 'Total Time'),
                                          const Divider(),
                                          SH.medium(),
                                          GestureDetector(
                                            onTap: () {
                                              ChecklistStatusCustomDialogBox(
                                                  context, index);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.checklist,
                                                  size: 20,
                                                  color: color.disabledColor,
                                                ),
                                                SW.medium(),
                                                const DescriptionText(
                                                    text: 'Checklist')
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    :
//Yes No
                                    Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                habbitSelectController
                                                    .habitStatus
                                                    .value = 'Pending';
                                              },
                                              child: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color.disabledColor
                                                          .withOpacity(0.2)),
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: color
                                                                .disabledColor
                                                                .withOpacity(
                                                                    0.4)),
                                                      ),
                                                      SH.small(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3),
                                                        decoration: BoxDecoration(
                                                            color: color
                                                                .disabledColor
                                                                .withOpacity(
                                                                    0.1),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5))),
                                                        child: Obx(
                                                          () => DescriptionText(
                                                            text: 'Pending',
                                                            color: habbitSelectController
                                                                        .habitStatus
                                                                        .value ==
                                                                    'Pending'
                                                                ? color
                                                                    .cardColor
                                                                : color
                                                                    .disabledColor,
                                                            isColor: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                habbitSelectController
                                                    .habitStatus.value = 'Done';
                                              },
                                              child: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(
                                                                  0.2)),
                                                      top: BorderSide(
                                                          color: color
                                                              .disabledColor
                                                              .withOpacity(
                                                                  0.2))),
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Obx(
                                                        () => Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: habbitSelectController
                                                                          .habitStatus
                                                                          .value ==
                                                                      'Done'
                                                                  ? Colors.green
                                                                      .shade100
                                                                  : color
                                                                      .disabledColor
                                                                      .withOpacity(
                                                                          0.2)),
                                                          child: Icon(
                                                            Icons.done,
                                                            color: habbitSelectController
                                                                        .habitStatus
                                                                        .value ==
                                                                    'Done'
                                                                ? Colors.green
                                                                : color
                                                                    .disabledColor,
                                                            size: 25,
                                                          ),
                                                        ),
                                                      ),
                                                      SH.small(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3),
                                                        decoration: BoxDecoration(
                                                            color: color
                                                                .disabledColor
                                                                .withOpacity(
                                                                    0.1),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5))),
                                                        child: Obx(
                                                          () => DescriptionText(
                                                            text: 'Done',
                                                            color: habbitSelectController
                                                                        .habitStatus
                                                                        .value ==
                                                                    'Done'
                                                                ? color
                                                                    .cardColor
                                                                : color
                                                                    .disabledColor,
                                                            isColor: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                habbitSelectController
                                                    .habitStatus.value = 'Fail';
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color
                                                            .disabledColor
                                                            .withOpacity(0.2)),
                                                  ),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: habbitSelectController
                                                                          .habitStatus
                                                                          .value ==
                                                                      'Fail'
                                                                  ? Colors.red
                                                                      .shade100
                                                                  : color
                                                                      .disabledColor
                                                                      .withOpacity(
                                                                          0.2)),
                                                          child: Icon(
                                                            Icons.done,
                                                            color: habbitSelectController
                                                                        .habitStatus
                                                                        .value ==
                                                                    'Fail'
                                                                ? Colors.red
                                                                : color
                                                                    .disabledColor,
                                                            size: 25,
                                                          ),
                                                        ),
                                                        SH.small(),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3),
                                                          decoration: BoxDecoration(
                                                              color: color
                                                                  .disabledColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          5))),
                                                          child: Obx(
                                                            () =>
                                                                DescriptionText(
                                                              text: 'Fail',
                                                              color: habbitSelectController
                                                                          .habitStatus
                                                                          .value ==
                                                                      'Fail'
                                                                  ? color
                                                                      .cardColor
                                                                  : color
                                                                      .disabledColor,
                                                              isColor: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        Row(
                          children: [
                            Icon(
                              Icons.message,
                              size: 20,
                              color: color.disabledColor,
                            ),
                            SW.medium(),
                            const DescriptionText(text: 'Save time as note')
                          ],
                        ),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        LabelText(text: 'CLOSE'.tr)
                      ]),
                ),
              )),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

// Task List Custome DailogBox

void TaskTimerCustomDialogBox(BuildContext context, int index) {
  AddTaskController taskController =
      Get.put(AddTaskController(), permanent: false);
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: color.primaryColor,
                                ),
                                SW.small(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        text: taskController
                                            .tasks[index].taskName),
                                    DescriptionText(
                                        text: taskController
                                            .tasks[index].taskDate
                                            .toIso8601String())
                                  ],
                                ),
                              ],
                            ),
                            Obx(() => IconWidgetClassic(
                                  icon: categoryController.icon[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              taskController
                                                  .tasks[index].categoryId)
                                          .icon],
                                  contanerColor: color.brightness ==
                                          Brightness.dark
                                      ? categoryController.iconColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  taskController
                                                      .tasks[index].categoryId)
                                              .color]
                                      : categoryController.iconLightColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  taskController
                                                      .tasks[index].categoryId)
                                              .color],
                                ))
                          ],
                        ),
                        SH.medium(),
                        const Divider(),
//Yes No

// Time
//                         taskController.tasks[index].evaluate == 'Timer'
//                             ? Column(
//                                 children: [
//                                   SH.large(),
//                                   const LabelTextLarge(text: '00:00'),
//                                   SH.small(),
//                                   const DescriptionText(text: 'Total Time'),
//                                   SH.large(),
//                                   const Divider(),
//                                   const DescriptionText(text: 'Current Time'),
//                                   SH.small(),
//                                   const LabelText(
//                                     text: '00:00',
//                                     isColor: true,
//                                   ),
//                                   const Divider(),
//                                   SH.medium(),
//                                   GestureDetector(
//                                     onTap: () {
//                                       TimeStatusCustomDialogBox(context, index);
//                                     },
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.alarm,
//                                           size: 20,
//                                           color: color.disabledColor,
//                                         ),
//                                         SW.medium(),
//                                         const DescriptionText(
//                                             text: 'Save time records')
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : taskController.tasks[index].evaluate ==
//                                     'Numeric'
//                                 ?

// //Nuimaric
//                                 Column(
//                                     children: [
//                                       SH.large(),
//                                       const LabelTextLarge(text: '00:00'),
//                                       SH.small(),
//                                       const DescriptionText(text: 'Total Time'),
//                                       SH.large(),
//                                       const Divider(),
//                                       const DescriptionText(text: 'Current'),
//                                       SH.small(),
//                                       const LabelText(
//                                         text: '0 smoke',
//                                         isColor: true,
//                                       ),
//                                       const Divider(),
//                                       SH.medium(),
//                                       GestureDetector(
//                                         onTap: () {
//                                           NumericStatusCustomDialogBox(
//                                               context, index);
//                                         },
//                                         child: Row(
//                                           children: [
//                                             Icon(
//                                               Icons.alarm,
//                                               size: 20,
//                                               color: color.disabledColor,
//                                             ),
//                                             SW.medium(),
//                                             const DescriptionText(
//                                                 text: 'Enter value manuually')
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   )
// // Checklist
//                                 : taskController
//                                             .tasks[index].evaluate ==
//                                         'Checklist'
//                                     ? Column(
//                                         children: [
//                                           SH.large(),
//                                           const LabelTextLarge(text: '00:00'),
//                                           SH.small(),
//                                           const DescriptionText(
//                                               text: 'Total Time'),
//                                           const Divider(),
//                                           SH.medium(),
//                                           GestureDetector(
//                                             onTap: () {
//                                               ChecklistStatusCustomDialogBox(
//                                                   context, index);
//                                             },
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.checklist,
//                                                   size: 20,
//                                                   color: color.disabledColor,
//                                                 ),
//                                                 SW.medium(),
//                                                 const DescriptionText(
//                                                     text: 'Checklist')
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     :
                        // taskController.checklist.length <= 0
                        //     ?
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  taskController.taskStatus.value = 'Pending';
                                },
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: color.disabledColor
                                            .withOpacity(0.2)),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: color.disabledColor
                                                  .withOpacity(0.4)),
                                        ),
                                        SH.small(),
                                        Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: color.disabledColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5))),
                                          child: Obx(
                                            () => DescriptionText(
                                              text: 'Pending',
                                              color: taskController
                                                          .taskStatus.value ==
                                                      'Pending'
                                                  ? color.cardColor
                                                  : color.disabledColor,
                                              isColor: true,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  taskController.taskStatus.value = 'Done';
                                },
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: color.disabledColor
                                                .withOpacity(0.2)),
                                        top: BorderSide(
                                            color: color.disabledColor
                                                .withOpacity(0.2)),
                                        right: BorderSide(
                                            color: color.disabledColor
                                                .withOpacity(0.2))),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Obx(
                                          () => Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: taskController
                                                            .taskStatus.value ==
                                                        'Done'
                                                    ? Colors.green.shade100
                                                    : color.disabledColor
                                                        .withOpacity(0.2)),
                                            child: Icon(
                                              Icons.done,
                                              color: taskController
                                                          .taskStatus.value ==
                                                      'Done'
                                                  ? Colors.green
                                                  : color.disabledColor,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                        SH.small(),
                                        Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: color.disabledColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5))),
                                          child: Obx(
                                            () => DescriptionText(
                                              text: 'Done',
                                              color: taskController
                                                          .taskStatus.value ==
                                                      'Done'
                                                  ? color.cardColor
                                                  : color.disabledColor,
                                              isColor: true,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // : DescriptionText(text: "vfv"),

                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        Row(
                          children: [
                            Icon(
                              Icons.message,
                              size: 20,
                              color: color.disabledColor,
                            ),
                            SW.medium(),
                            const DescriptionText(text: 'Save time as note')
                          ],
                        ),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        LabelText(text: 'CLOSE'.tr)
                      ]),
                ),
              )),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

// recurring task list custom dailog box

void RecurringTimerCustomDialogBox(BuildContext context, int index) {
  AddRecurringTaskController recurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: color.primaryColor,
                                ),
                                SW.small(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        text: recurringTaskController
                                            .tasks[index].rTaskName),
                                    DescriptionText(
                                        text: recurringTaskController
                                            .tasks[index].endDate
                                            .toIso8601String())
                                  ],
                                ),
                              ],
                            ),
                            Obx(() => IconWidgetClassic(
                                  icon: categoryController.icon[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              recurringTaskController
                                                  .tasks[index].categoryId)
                                          .icon],
                                  contanerColor: color.brightness ==
                                          Brightness.dark
                                      ? categoryController.iconColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  recurringTaskController
                                                      .tasks[index].categoryId)
                                              .color]
                                      : categoryController.iconLightColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  recurringTaskController
                                                      .tasks[index].categoryId)
                                              .color],
                                ))
                          ],
                        ),
                        SH.medium(),
                        const Divider(),
//Yes No

// Time
//                         recurringTaskController.tasks[index].evaluate == 'Timer'
//                             ? Column(
//                                 children: [
//                                   SH.large(),
//                                   const LabelTextLarge(text: '00:00'),
//                                   SH.small(),
//                                   const DescriptionText(text: 'Total Time'),
//                                   SH.large(),
//                                   const Divider(),
//                                   const DescriptionText(text: 'Current Time'),
//                                   SH.small(),
//                                   const LabelText(
//                                     text: '00:00',
//                                     isColor: true,
//                                   ),
//                                   const Divider(),
//                                   SH.medium(),
//                                   GestureDetector(
//                                     onTap: () {
//                                       TimeStatusCustomDialogBox(context, index);
//                                     },
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.alarm,
//                                           size: 20,
//                                           color: color.disabledColor,
//                                         ),
//                                         SW.medium(),
//                                         const DescriptionText(
//                                             text: 'Save time records')
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : recurringTaskController.tasks[index].evaluate ==
//                                     'Numeric'
//                                 ?

// //Nuimaric
//                                 Column(
//                                     children: [
//                                       SH.large(),
//                                       const LabelTextLarge(text: '00:00'),
//                                       SH.small(),
//                                       const DescriptionText(text: 'Total Time'),
//                                       SH.large(),
//                                       const Divider(),
//                                       const DescriptionText(text: 'Current'),
//                                       SH.small(),
//                                       const LabelText(
//                                         text: '0 smoke',
//                                         isColor: true,
//                                       ),
//                                       const Divider(),
//                                       SH.medium(),
//                                       GestureDetector(
//                                         onTap: () {
//                                           NumericStatusCustomDialogBox(
//                                               context, index);
//                                         },
//                                         child: Row(
//                                           children: [
//                                             Icon(
//                                               Icons.alarm,
//                                               size: 20,
//                                               color: color.disabledColor,
//                                             ),
//                                             SW.medium(),
//                                             const DescriptionText(
//                                                 text: 'Enter value manuually')
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   )
// // Checklist
//                                 :
                        recurringTaskController.tasks[index].evaluate ==
                                'Checklist'
                            ? Column(
                                children: [
                                  SH.large(),
                                  const LabelTextLarge(text: '00:00'),
                                  SH.small(),
                                  const DescriptionText(text: 'Total Time'),
                                  const Divider(),
                                  SH.medium(),
                                  GestureDetector(
                                    onTap: () {
                                      ChecklistStatusCustomDialogBox(
                                          context, index);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.checklist,
                                          size: 20,
                                          color: color.disabledColor,
                                        ),
                                        SW.medium(),
                                        const DescriptionText(text: 'Checklist')
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        recurringTaskController
                                            .recurringTaskStatus
                                            .value = 'Pending';
                                      },
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: color.disabledColor
                                                  .withOpacity(0.2)),
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: color.disabledColor
                                                        .withOpacity(0.4)),
                                              ),
                                              SH.small(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Obx(
                                                  () => DescriptionText(
                                                    text: 'Pending',
                                                    color: recurringTaskController
                                                                .recurringTaskStatus
                                                                .value ==
                                                            'Pending'
                                                        ? color.cardColor
                                                        : color.disabledColor,
                                                    isColor: true,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        recurringTaskController
                                            .recurringTaskStatus.value = 'Done';
                                      },
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: color.disabledColor
                                                      .withOpacity(0.2)),
                                              top: BorderSide(
                                                  color: color.disabledColor
                                                      .withOpacity(0.2)),
                                              right: BorderSide(
                                                  color: color.disabledColor
                                                      .withOpacity(0.2))),
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Obx(
                                                () => Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: recurringTaskController
                                                                  .recurringTaskStatus
                                                                  .value ==
                                                              'Done'
                                                          ? Colors
                                                              .green.shade100
                                                          : color.disabledColor
                                                              .withOpacity(
                                                                  0.2)),
                                                  child: Icon(
                                                    Icons.done,
                                                    color: recurringTaskController
                                                                .recurringTaskStatus
                                                                .value ==
                                                            'Done'
                                                        ? Colors.green
                                                        : color.disabledColor,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                              SH.small(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    color: color.disabledColor
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Obx(
                                                  () => DescriptionText(
                                                    text: 'Done',
                                                    color: recurringTaskController
                                                                .recurringTaskStatus
                                                                .value ==
                                                            'Done'
                                                        ? color.cardColor
                                                        : color.disabledColor,
                                                    isColor: true,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        // : DescriptionText(text: "vfv"),

                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        Row(
                          children: [
                            Icon(
                              Icons.message,
                              size: 20,
                              color: color.disabledColor,
                            ),
                            SW.medium(),
                            const DescriptionText(text: 'Save time as note')
                          ],
                        ),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        LabelText(text: 'CLOSE'.tr)
                      ]),
                ),
              )),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
