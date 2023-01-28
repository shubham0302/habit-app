// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/screens/getPremium_dailbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/reminder_custom_dailbox.dart';
import 'package:habbit_app/screens/task_screen/catagorytask_dailog.dart';
import 'package:habbit_app/screens/task_screen/checklisttask_dailog.dart';
import 'package:habbit_app/screens/task_screen/nametask_dailog.dart';
import 'package:habbit_app/screens/task_screen/prioritytask_dailog.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PremiumController premiumController =
        Get.put(PremiumController(), permanent: false);
    AddTaskController addTaskController =
        Get.put(AddTaskController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        Get.back();
                      }),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: color.primaryColor,
                        ),
                      )),
                  SW.medium(),
                  MainLabelText(text: 'Add New Task'.tr),
                ],
              ),
              SH.large(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.small(),
                      LabelText(text: "Task Name".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      NameTaskCustomDialogBox(context);
                      // CategoryCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: color.canvasColor),
                          color: color.backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Obx(
                            () => LabelText(
                              text: addTaskController.taskName.value == ''
                                  ? "name".tr
                                  : addTaskController.taskName.value,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.category_outlined,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Category".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      CategoryTaskCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    // ToDoWeekCustomDialogBox(context);

                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: color.canvasColor),
                          color: color.backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  addTaskController.categoryId.value != 0
                                      ? categoryController.icon[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  addTaskController
                                                      .categoryId.value)
                                              .icon]
                                      : Icons.abc,
                                  color: addTaskController.categoryId.value != 0
                                      ?
                                      // categoryController.iconColor[
                                      //     categoryController.categories
                                      //         .firstWhere((element) =>
                                      //             element.id ==
                                      //             addTaskController
                                      //                 .categoryId.value)
                                      //         .color]
                                      color.brightness == Brightness.dark
                                          ? categoryController.iconColor[
                                              categoryController.categories
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      addTaskController
                                                          .categoryId.value)
                                                  .color]
                                          : categoryController.iconLightColor[
                                              categoryController.categories
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      addTaskController
                                                          .categoryId.value)
                                                  .color]
                                      : color.primaryColor,
                                ),
                                // addTaskController.categoryIcon.value,
                                SW.small(),
                                LabelText(
                                  text: addTaskController.categoryId != 0
                                      ? categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              addTaskController
                                                  .categoryId.value)
                                          .name
                                      : 'Select'.tr,
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.large(),
              SH.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Date".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      addTaskController.setDate(context);

                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: color.canvasColor),
                          color: color.backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Obx(
                            () => LabelText(
                              text:
                                  "${addTaskController.date.value.day}/${addTaskController.date.value.month}/${addTaskController.date.value.year}",
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.list_outlined,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText(text: "Checklist".tr),
                          premiumController.premium.value == false
                              ? DescriptionText(
                                  text: 'Premium feature',
                                  isColor: true,
                                )
                              : SizedBox(),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (premiumController.premium.value == false) {
                        GetPremiumCustomDialogBox(context);
                      } else {
                        ChecklistTaskCustomDialogBox(context);
                      }
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: color.canvasColor),
                          color: color.backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LabelText(
                                text: addTaskController.updateRepetation.value,
                                isDotDot: true,
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Reminders".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      reminderCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: color.canvasColor),
                          color: color.backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              LabelText(
                                text: "custom",
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.flag,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Priority".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      PriorityTaskCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: color.canvasColor),
                          color: color.backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => LabelText(
                                text: addTaskController.updatePriority.value
                                    .toString(),
                              ),
                            ),
                            SW.small(),
                            const Icon(Icons.flag_sharp)
                          ],
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              GestureDetector(
                onTap: () {
                  addTaskController.pendingTask.value == true
                      ? addTaskController.pendingTask.value = false
                      : addTaskController.pendingTask.value = true;
                  print(addTaskController.pendingTask.value);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                          color: color.primaryColor,
                        ),
                        SW.medium(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(text: "Pending task".tr),
                            SH.small(),
                            DescriptionText(
                                text: "It will be shown each day unit completed"
                                    .tr)
                          ],
                        )
                      ],
                    ),
                    Obx(
                      () => addTaskController.pendingTask.value == false
                          ? Icon(
                              Icons.circle_outlined,
                              size: 30,
                              color: color.primaryColor,
                            )
                          : Icon(
                              Icons.check_circle,
                              color: color.primaryColor,

                              size: 30,
                              // color: color.disabledColor,
                            ),
                    )
                  ],
                ),
              ),
              SH.medium(),
              SH.large(),
              // SH.large(),
              // SH.large(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    addTaskController.addReminder();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 2, color: color.primaryColor),
                        color: color.backgroundColor),
                    child: Center(
                      child: MainLabelText(
                        text: "Add Task".tr,
                        isColor: true,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
