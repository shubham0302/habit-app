// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/category_custom_dialog.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/name_custom_dailogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/priority_custom_dilogbox.dart';
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
                  const MainLabelText(text: 'Add New Task'),
                ],
              ),
              SH.large(),
              SH.large(),
              GestureDetector(
                onTap: () {},
                child: Row(
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
                        const LabelText(text: "Task Name")
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.hintColor),
                          child: Center(
                            child: Obx(
                              () => LabelText(
                                text: addTaskController.taskName.value == ''
                                    ? "name"
                                    : addTaskController.taskName.value,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
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
                      const LabelText(text: "Category")
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
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
                                      ? categoryController.iconColor[
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
                                      : 'Select',
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
                      const LabelText(text: "Date")
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
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
                      const LabelText(text: "Checklist")
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ChecklistTaskCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
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
                      const LabelText(text: "Reminders")
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ReminderCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              LabelText(
                                text: "0",
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
                      const LabelText(text: "Priority")
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
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
                            const LabelText(text: "Pending task"),
                            SH.small(),
                            const DescriptionText(
                                text:
                                    "It will be shown each day unit completed")
                          ],
                        )
                      ],
                    ),
                    Obx(
                      () => addTaskController.pendingTask.value == false
                          ? Icon(
                              Icons.circle_outlined,
                              size: 30,
                              color: color.disabledColor,
                            )
                          : const Icon(
                              Icons.check_circle,
                              size: 30,
                              // color: color.disabledColor,
                            ),
                    )
                  ],
                ),
              ),
              SH.medium(),
              SH.large(),
              SH.large(),
              SH.large(),
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
                    child: const Center(
                      child: MainLabelText(
                        text: "Add Task",
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
