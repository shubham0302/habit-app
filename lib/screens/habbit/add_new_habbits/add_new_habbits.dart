// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/category_custom_dialog.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/reminder_custom_dilogbox.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/repetation_custom_dilogbox.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class AddHabbitsScreen extends StatelessWidget {
  const AddHabbitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddHabbitSelectController addHabbitsScreen =
        Get.put(AddHabbitSelectController(), permanent: false);

    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (() {
                      Get.back();
                    }),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: color.primaryColor,
                    )),
                SW.medium(),
                const MainLabelText(text: 'Add New Habit'),
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
                      const LabelText(text: "Habit Name")
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
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
                        child: const Center(
                          child: LabelText(
                            text: "Cook Boiled Egg",
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
                    const LabelText(text: "Description")
                  ],
                ),
                GestureDetector(
                  onTap: () {
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
                      child: const Center(
                        child: LabelText(
                          text: "Boild food is very..",
                          isDotDot: true,
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
                    const LabelText(text: "Category")
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: color.hintColor),
                      child: Center(
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              addHabbitsScreen.categoryIcon.value,
                              SW.small(),
                              LabelText(
                                text: addHabbitsScreen.updateCategory.value,
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
                    const LabelText(text: "Start Date")
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: addHabbitsScreen.startDate.value,
                        firstDate: DateTime(1997),
                        lastDate: DateTime(2030));
                    if (newDate == null) return;
                    addHabbitsScreen.startDate.value = newDate;
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
                                "${addHabbitsScreen.startDate.value.day}/${addHabbitsScreen.startDate.value.month}/${addHabbitsScreen.startDate.value.year}",
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
                    const LabelText(text: "End Date")
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: addHabbitsScreen.endDate.value,
                        firstDate: DateTime(1997),
                        lastDate: DateTime(2030));
                    if (newDate == null) return;
                    addHabbitsScreen.endDate.value = newDate;
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
                                "${addHabbitsScreen.endDate.value.day}/${addHabbitsScreen.endDate.value.month}/${addHabbitsScreen.endDate.value.year}",
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
                    const LabelText(text: "Repetation")
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: color.hintColor),
                      child: Center(
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LabelText(
                              text: addHabbitsScreen.updateRepetation.value,
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
                          children: [
                            Obx(
                              () => LabelText(
                                text: addHabbitsScreen.updateReminder.value,
                              ),
                            ),
                            SW.small(),
                            Icon(Icons.flag_sharp)
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
                      child: const Center(
                        child: LabelText(
                          text: "1",
                        ),
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
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2, color: color.primaryColor),
                    color: color.backgroundColor),
                child: const Center(
                  child: MainLabelText(
                    text: "Add Habit",
                    isColor: true,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
