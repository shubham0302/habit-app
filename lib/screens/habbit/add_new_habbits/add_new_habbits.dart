// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/category_custom_dialog.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/name_custom_dailogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/priority_custom_dilogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/reminder_custom_dailbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/repetation_custom_dilogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/evaluate_select_customdailbox.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class AddHabbitsScreen extends StatelessWidget {
  const AddHabbitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddHabbitSelectController addRecurringTaskController =
        Get.put(AddHabbitSelectController(), permanent: false);
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
                   MainLabelText(text: 'Add New Habbit'.tr),
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
                         LabelText(text: "Task Name".tr)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        NameCustomDialogBox(context);
                      },
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 35,
                          width: 140,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: color.canvasColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.backgroundColor),
                          child: Center(
                            child: Obx(
                              () => LabelText(
                                text: addRecurringTaskController
                                            .updateName.value ==
                                        ''
                                    ? "name".tr
                                    : addRecurringTaskController
                                        .updateName.value,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SH.large(),
              SH.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                       LabelText(text: "Description".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      NameCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Center(
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LabelText(
                                text: addRecurringTaskController
                                            .updateDescription.value ==
                                        ''
                                    ? "Description".tr
                                    : addRecurringTaskController
                                        .updateDescription.value,
                                isDotDot: true,
                              ),
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
                        Icons.info,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                       LabelText(text: "Evaluate".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      EvaluateCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => LabelText(
                                  text: addRecurringTaskController
                                      .selectEvaluate.value),
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
                      CategoryCustomDialogBox(context);
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Center(
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  addRecurringTaskController.categoryId.value !=
                                          0
                                      ? categoryController.icon[
                                          categoryController
                                              .categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  addRecurringTaskController
                                                      .categoryId.value)
                                              .icon]
                                      : Icons.abc,
                                  color: addRecurringTaskController
                                              .categoryId.value !=
                                          0
                                      ?
                                      // categoryController.iconColor[
                                      //     categoryController.categories
                                      //         .firstWhere((element) =>
                                      //             element.id ==
                                      //             addRecurringTaskController
                                      //                 .categoryId.value)
                                      //         .color]
                                      color.brightness == Brightness.dark
                                          ? categoryController.iconColor[
                                              categoryController.categories
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      addRecurringTaskController
                                                          .categoryId.value)
                                                  .color]
                                          : categoryController.iconLightColor[
                                              categoryController.categories
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      addRecurringTaskController
                                                          .categoryId.value)
                                                  .color]
                                      : color.primaryColor,
                                ),
                                // addRecurringTaskController.categoryIcon.value,
                                SW.small(),
                                LabelText(
                                  text:
                                      addRecurringTaskController.categoryId != 0
                                          ? categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  addRecurringTaskController
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
                       LabelText(text: "Start Date".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate:
                              addRecurringTaskController.startDate.value,
                          firstDate: DateTime(1997),
                          lastDate: DateTime(2030));
                      if (newDate == null) return;
                      addRecurringTaskController.startDate.value = newDate;
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Center(
                          child: Obx(
                            () => LabelText(
                              text:
                                  "${addRecurringTaskController.startDate.value.day}/${addRecurringTaskController.startDate.value.month}/${addRecurringTaskController.startDate.value.year}",
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
                        Icons.calendar_today,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                       LabelText(text: "End Date".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: addRecurringTaskController.endDate.value,
                          firstDate: DateTime(1997),
                          lastDate: DateTime(2030));
                      if (newDate == null) return;
                      addRecurringTaskController.endDate.value = newDate;
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Center(
                          child: Obx(
                            () => LabelText(
                              text:
                                  "${addRecurringTaskController.endDate.value.day}/${addRecurringTaskController.endDate.value.month}/${addRecurringTaskController.endDate.value.year}",
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
                        Icons.note_add,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                       LabelText(text: "Repetation".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      RepetationCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Center(
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LabelText(
                                text: addRecurringTaskController
                                    .updateRepetation.value,
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
                      ReminderCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
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
                       LabelText(text: "Priority".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      PriorityCustomDialogBox(context);
                      // ToDoWeekCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => LabelText(
                                text: addRecurringTaskController
                                    .updatePriority.value
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
              SH.large(),
              SH.large(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    addRecurringTaskController.addRepetition();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 2, color: color.primaryColor),
                        color: color.backgroundColor),
                    child:  Center(
                      child: MainLabelText(
                        text: "Add Habbit".tr,
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
