// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class AddHabbitsScreen extends StatelessWidget {
  const AddHabbitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          text: "Cooking",
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
                          text: "09/12/2022",
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
                          text: "09/12/2022",
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
                          text: "every day",
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
