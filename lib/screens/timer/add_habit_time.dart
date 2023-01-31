// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/time_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text_large.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../../widgets/icon_widget.dart';
import 'habit_timer_dailog.dart';

void addTimeHabitCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);
  NotifyTimeController notifyTimeController =
      Get.put(NotifyTimeController(), permanent: false);
  AddTaskController taskController =
      Get.put(AddTaskController(), permanent: false);
  AddRecurringTaskController recurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: color.backgroundColor,
                  content: Container(
                    width: 300,
                    // height: 180,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      notifyTimeController.listSelect.value =
                                          'Habit';
                                    },
                                    child: Container(
                                      height: 35,
                                      // width: 60,
                                      decoration: BoxDecoration(
                                          color: notifyTimeController
                                                      .listSelect.value ==
                                                  'Habit'
                                              ? color.primaryColor
                                                  .withOpacity(0.3)
                                              : color.backgroundColor,
                                          border: Border.all(
                                              color: color.primaryColor),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                      child: Center(
                                        child: MainLabelText(
                                          text: 'Habit',
                                          isColor: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      notifyTimeController.listSelect.value =
                                          'Tasks';
                                    },
                                    child: Container(
                                      height: 35,
                                      // width: 60,
                                      decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: color.primaryColor),
                                            bottom: BorderSide(
                                                color: color.primaryColor)),
                                        color: notifyTimeController
                                                    .listSelect.value ==
                                                'Tasks'
                                            ? color.primaryColor
                                                .withOpacity(0.3)
                                            : color.backgroundColor,
                                      ),
                                      child: const Center(
                                        child: MainLabelText(
                                          text: 'Tasks',
                                          isColor: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      notifyTimeController.listSelect.value =
                                          'Recurring';
                                    },
                                    child: Container(
                                      height: 35,
                                      // width: 60,
                                      decoration: BoxDecoration(
                                          color: notifyTimeController
                                                      .listSelect.value ==
                                                  'Recurring'
                                              ? color.primaryColor
                                                  .withOpacity(0.3)
                                              : color.backgroundColor,
                                          border: Border.all(
                                              color: color.primaryColor),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: const Center(
                                        child: MainLabelText(
                                          text: 'Recurring',
                                          isColor: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SH.medium(),
                          Obx(
                            () => notifyTimeController.listSelect.value ==
                                    'Habit'
                                ? HabitList()
                                : notifyTimeController.listSelect.value ==
                                        'Tasks'
                                    ? TaslList()
                                    : notifyTimeController.listSelect.value ==
                                            'Recurring'
                                        ? RecurringList()
                                        : SizedBox(),
                          ),
                          SH.large(),
                          Center(
                            child: MainLabelText(
                              text: 'CLOSE'.tr,
                              isColor: true,
                            ),
                          )
                        ]),
                  ))),
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

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    AddHabbitSelectController habbitSelectController =
        Get.put(AddHabbitSelectController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                HabitTimerCustomDialogBox(context, index);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => IconWidget(
                      icon: categoryController.categories
                          .firstWhere((element) =>
                              element.id ==
                              habbitSelectController.tasks
                                  .where((p0) => p0.archive == false)
                                  .toList()[index]
                                  .categoryId)
                          .icon,
                      color: categoryController.categories
                          .firstWhere((element) =>
                              element.id ==
                              habbitSelectController.tasks
                                  .where((p0) => p0.archive == false)
                                  .toList()[index]
                                  .categoryId)
                          .color)),
                  SW.medium(),
                  DescriptionTextLarge(
                      text: habbitSelectController.tasks[index].habitName)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1),
          itemCount: habbitSelectController.tasks.length),
    );
  }
}

class TaslList extends StatelessWidget {
  const TaslList({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    AddTaskController taskController =
        Get.put(AddTaskController(), permanent: false);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                TaskTimerCustomDialogBox(context, index);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => IconWidget(
                      icon: categoryController.categories
                          .firstWhere((element) =>
                              element.id ==
                              taskController.tasks
                                  .where((p0) => p0.archive == false)
                                  .toList()[index]
                                  .categoryId)
                          .icon,
                      color: categoryController.categories
                          .firstWhere((element) =>
                              element.id ==
                              taskController.tasks
                                  .where((p0) => p0.archive == false)
                                  .toList()[index]
                                  .categoryId)
                          .color)),
                  SW.medium(),
                  DescriptionTextLarge(
                      text: taskController.tasks[index].taskName)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1),
          itemCount: taskController.tasks.length),
    );
  }
}

class RecurringList extends StatelessWidget {
  const RecurringList({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    AddRecurringTaskController recurringTaskController =
        Get.put(AddRecurringTaskController(), permanent: false);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                RecurringTimerCustomDialogBox(context, index);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => IconWidget(
                      icon: categoryController.categories
                          .firstWhere((element) =>
                              element.id ==
                              recurringTaskController.tasks
                                  .where((p0) => p0.archive == false)
                                  .toList()[index]
                                  .categoryId)
                          .icon,
                      color: categoryController.categories
                          .firstWhere((element) =>
                              element.id ==
                              recurringTaskController.tasks
                                  .where((p0) => p0.archive == false)
                                  .toList()[index]
                                  .categoryId)
                          .color)),
                  SW.medium(),
                  DescriptionTextLarge(
                      text: recurringTaskController.tasks[index].rTaskName)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1),
          itemCount: recurringTaskController.tasks.length),
    );
  }
}
