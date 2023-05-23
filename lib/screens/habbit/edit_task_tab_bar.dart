// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/category_custom_dialog.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/evaluate_select_customdailbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/name_custom_dailogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/priority_custom_dilogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/reminder_custom_dailbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/repetation_custom_dilogbox.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class EditTaskTabBar extends StatelessWidget {
  const EditTaskTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddHabbitSelectController addRecurringTaskController =
        Get.put(AddHabbitSelectController(), permanent: false);

    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    var color = Theme.of(context);

    var index = addRecurringTaskController.selectedTaskIndex.value;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Obx(
                  () => CreateLabelWithField(
                    onTap: () => NameCustomDialogBox(context),
                    icon: Icons.edit,
                    titleName: 'Task Name',
                    fieldValue:
                        addRecurringTaskController.updateName.value == ''
                            ? addRecurringTaskController.tasks
                                .where((tasks) => tasks.archive == false)
                                .toList()[index]
                                .habitName
                                .tr
                            : addRecurringTaskController.updateName.value.tr,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.edit,
                //           size: 30,
                //           color: color.primaryColor,
                //         ),
                //         SW.small(),
                //         LabelText(text: "Task Name".tr),
                //       ],
                //     ),
                //     GestureDetector(
                //       onTap: () => NameCustomDialogBox(context),
                //       child: Container(
                //         alignment: Alignment.centerLeft,
                //         height: 35,
                //         width: 140,
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: color.canvasColor,
                //           ),
                //           borderRadius: const BorderRadius.all(
                //             Radius.circular(10),
                //           ),
                //           color: color.backgroundColor,
                //         ),
                //         child: Center(
                //           child: Obx(
                //             () => LabelText(
                //               text: addRecurringTaskController
                //                           .updateName.value ==
                //                       ''
                //                   ? "name".tr
                //                   : addRecurringTaskController.updateName.value,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SH.large(),
                SH.medium(),
                Obx(
                  () => CreateLabelWithField(
                    onTap: () => NameCustomDialogBox(context),
                    icon: Icons.info,
                    titleName: 'Description'.tr,
                    fieldValue:
                        addRecurringTaskController.updateDescription.value == ''
                            ? addRecurringTaskController.tasks
                                .where((tasks) => tasks.archive == false)
                                .toList()[index]
                                .habbitDescription
                                .tr
                            : addRecurringTaskController
                                .updateDescription.value,
                    isDot: true,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.info,
                //           size: 30,
                //           color: color.primaryColor,
                //         ),
                //         SW.medium(),
                //         LabelText(text: "Description".tr),
                //       ],
                //     ),
                //     GestureDetector(
                //       onTap: () => NameCustomDialogBox(context),
                //       child: Container(
                //         alignment: Alignment.centerLeft,
                //         height: 35,
                //         width: 140,
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: color.canvasColor,
                //           ),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10)),
                //           color: color.backgroundColor,
                //         ),
                //         child: Center(
                //           child: Obx(
                //             () => Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: LabelText(
                //                 text: addRecurringTaskController
                //                             .updateDescription.value ==
                //                         ''
                //                     ? "Description".tr
                //                     : addRecurringTaskController
                //                         .updateDescription.value,
                //                 isDotDot: true,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SH.large(),
                SH.medium(),
                Obx(
                  () => CreateLabelWithField(
                    onTap: () => EvaluateCustomDialogBox(context),
                    icon: Icons.info,
                    titleName: 'Evaluate'.tr,
                    fieldValue: addRecurringTaskController.selectEvaluate.value,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.info,
                //           size: 30,
                //           color: color.primaryColor,
                //         ),
                //         SW.medium(),
                //         LabelText(text: "Evaluate".tr)
                //       ],
                //     ),
                //     GestureDetector(
                //       onTap: () => EvaluateCustomDialogBox(context),
                //       child: Container(
                //         alignment: Alignment.centerLeft,
                //         height: 35,
                //         width: 140,
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: color.canvasColor,
                //           ),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10)),
                //           color: color.backgroundColor,
                //         ),
                //         child: Center(
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Obx(
                //               () => LabelText(
                //                 text: addRecurringTaskController
                //                     .selectEvaluate.value,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
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
                      onTap: () => CategoryCustomDialogBox(context),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: color.canvasColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: color.backgroundColor,
                        ),
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
                                      ? color.brightness == Brightness.dark
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
                                              .tr
                                          : 'Select'.tr,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            firstDate: DateTime.now(),
                            lastDate: addRecurringTaskController.endDate.value);
                        if (newDate == null) return;
                        addRecurringTaskController.startDate.value = newDate;
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
                          color: color.backgroundColor,
                        ),
                        child: Center(
                          child: Obx(
                            () => LabelText(
                              text:
                                  "${addRecurringTaskController.startDate.value.day}/${addRecurringTaskController.startDate.value.month}/${addRecurringTaskController.startDate.value.year}",
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            initialDate:
                                addRecurringTaskController.endDate.value,
                            firstDate:
                                addRecurringTaskController.startDate.value,
                            lastDate: DateTime(2030));
                        if (newDate == null) return;
                        addRecurringTaskController.endDate.value = newDate;
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
                          color: color.backgroundColor,
                        ),
                        child: Center(
                          child: Obx(
                            () => LabelText(
                              text:
                                  "${addRecurringTaskController.endDate.value.day}/${addRecurringTaskController.endDate.value.month}/${addRecurringTaskController.endDate.value.year}",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SH.medium(),
                SH.large(),
                Obx(
                  () => CreateLabelWithField(
                    onTap: () => RepetationCustomDialogBox(context),
                    icon: Icons.note_add,
                    titleName: 'Repetation'.tr,
                    fieldValue:
                        addRecurringTaskController.updateRepetation.value,
                    isDot: true,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.note_add,
                //           size: 30,
                //           color: color.primaryColor,
                //         ),
                //         SW.medium(),
                //         LabelText(text: "Repetation".tr)
                //       ],
                //     ),
                //     // GestureDetector(
                //     //   onTap: () => RepetationCustomDialogBox(context),
                //     //   child: Container(
                //     //     alignment: Alignment.centerLeft,
                //     //     height: 35,
                //     //     width: 140,
                //     //     decoration: BoxDecoration(
                //     //       border: Border.all(
                //     //         width: 2,
                //     //         color: color.canvasColor,
                //     //       ),
                //     //       borderRadius:
                //     //           const BorderRadius.all(Radius.circular(10)),
                //     //       color: color.backgroundColor,
                //     //     ),
                //     //     child: Center(
                //     //       child: Obx(
                //     //         () => Padding(
                //     //           padding: const EdgeInsets.all(8.0),
                //     //           child: LabelText(
                //     //             text: addRecurringTaskController
                //     //                 .updateRepetation.value,
                //     //             isDotDot: true,
                //     //           ),
                //     //         ),
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                SH.medium(),
                SH.large(),
                Obx(
                  () => CreateLabelWithField(
                    onTap: () => reminderCustomDialogBox(context),
                    icon: Icons.calendar_today_sharp,
                    titleName: 'Reminders'.tr,
                    fieldValue:
                        addRecurringTaskController.remList.length.toString(),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.calendar_today_sharp,
                //           size: 30,
                //           color: color.primaryColor,
                //         ),
                //         SW.medium(),
                //         LabelText(text: "Reminders".tr)
                //       ],
                //     ),
                //     GestureDetector(
                //       onTap: () => reminderCustomDialogBox(context),
                //       child: Container(
                //         alignment: Alignment.centerLeft,
                //         height: 35,
                //         width: 140,
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: color.canvasColor,
                //           ),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10)),
                //           color: color.backgroundColor,
                //         ),
                //         child: Center(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Obx(
                //                 () => LabelText(
                //                   text: addRecurringTaskController
                //                       .remList.length
                //                       .toString(),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SH.medium(),
                SH.large(),
                Obx(
                  () => CreateLabelWithField(
                    onTap: () => PriorityCustomDialogBox(context),
                    icon: Icons.flag,
                    titleName: 'Priority'.tr,
                    fieldValue:
                    // addRecurringTaskController.tasks
                    //     .where((p0) => p0.archive == false)
                    //     .toList()[index]
                    //     .priority
                    //     .toString(),
                    addRecurringTaskController.updatePriority.value
                        .toString(),
                    showPriorityFlag: true,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.flag,
                //           size: 30,
                //           color: color.primaryColor,
                //         ),
                //         SW.medium(),
                //         LabelText(text: "Priority".tr)
                //       ],
                //     ),
                //     Container(
                //       alignment: Alignment.centerLeft,
                //       height: 35,
                //       width: 140,
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 2, color: color.canvasColor),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(10)),
                //         color: color.backgroundColor,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Obx(
                //             () => LabelText(
                //               text: addRecurringTaskController
                //                   .updatePriority.value
                //                   .toString(),
                //             ),
                //           ),
                //           SW.small(),
                //           const Icon(Icons.flag_sharp)
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                SH.large(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      addRecurringTaskController.editRepetition(
                        context: context,
                        goingToEditHabbitId:
                            addRecurringTaskController.selectedTaskIndex.value +
                                1,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 2,
                          color: color.primaryColor,
                        ),
                        color: color.backgroundColor,
                      ),
                      child: Center(
                        child: MainLabelText(
                          text: "Edit Habbit".tr,
                          isColor: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateLabelWithField extends StatelessWidget {
  const CreateLabelWithField({
    required this.onTap,
    required this.icon,
    required this.titleName,
    required this.fieldValue,
    this.isDot = false,
    this.showPriorityFlag = false,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final IconData icon;
  final String titleName;
  final String fieldValue;
  final bool isDot;
  final bool showPriorityFlag;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: color.primaryColor,
            ),
            SW.small(),
            LabelText(text: titleName.tr),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 35,
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: color.canvasColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: color.backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: LabelText(
                    text: fieldValue,
                    isDotDot: isDot,
                  ),
                ),
                if (showPriorityFlag) SW.small(),
                if (showPriorityFlag) const Icon(Icons.flag_sharp)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
