// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class ToDoHabbitListScreen extends StatelessWidget {
  const ToDoHabbitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: color.primaryColor,
                    size: 20,
                  ),
                ),
                SW.medium(),
                const HeadingText(text: "Todo and Habit lists"),
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
                        Icons.calendar_month,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.small(),
                      const LabelText(text: "First day of the week")
                    ],
                  ),
                  Container(
                      height: 30,
                      width: 110,
                      child: const InputField(
                        hintText: "Sunday",
                      ))
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
                      Icons.check_circle,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Completed activity sorting")
                  ],
                ),
                Container(
                    height: 30,
                    width: 110,
                    child: const InputField(
                      hintText: "Send to bottom",
                    ))
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
                      Icons.list_alt_sharp,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Todo list order sorting")
                  ],
                ),
                Container(
                    height: 30,
                    width: 110,
                    child: const InputField(
                      hintText: "Alphabetical",
                    ))
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
                      Icons.format_list_bulleted_rounded,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Habit section order sorting")
                  ],
                ),
                Container(
                    height: 30,
                    width: 110,
                    child: const InputField(
                      hintText: "Date created",
                    ))
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
                      Icons.text_fields,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Text sizing")
                  ],
                ),
                Container(
                    height: 30,
                    width: 110,
                    child: const InputField(
                      hintText: "Default",
                    ))
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
                      Icons.touch_app,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Swap tap and long tap")
                  ],
                ),
                Obx(
                  () => FlutterSwitch(
                    activeColor: color.primaryColor,
                    activeToggleColor: color.backgroundColor,

                    width: 50.0,
                    height: 25.0,
                    valueFontSize: 15.0,
                    toggleSize: 20.0,
                    value: switchController.SwipSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.SwipSwichChange.value == true
                          ? switchController.SwipSwichChange.value = false
                          : switchController.SwipSwichChange.value = true;
                      // status = val;
                      // setState(() {
                      //   status = val;
                      // });
                    },
                  ),
                ),
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
                      Icons.vibration,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Vibration")
                  ],
                ),
                Obx(
                  () => FlutterSwitch(
                    activeColor: color.primaryColor,
                    activeToggleColor: color.backgroundColor,

                    width: 50.0,
                    height: 25.0,
                    valueFontSize: 15.0,
                    toggleSize: 20.0,
                    value: switchController.SwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.SwichChange.value == true
                          ? switchController.SwichChange.value = false
                          : switchController.SwichChange.value = true;
                      // status = val;
                      // setState(() {
                      //   status = val;
                      // });
                    },
                  ),
                ),
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
                      Icons.library_books,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Collapse habit cards")
                  ],
                ),
                Obx(
                  () => FlutterSwitch(
                    activeColor: color.primaryColor,
                    activeToggleColor: color.backgroundColor,

                    width: 50.0,
                    height: 25.0,
                    valueFontSize: 15.0,
                    toggleSize: 20.0,
                    value: switchController.CollapseSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.CollapseSwichChange.value == true
                          ? switchController.CollapseSwichChange.value = false
                          : switchController.CollapseSwichChange.value = true;
                      // status = val;
                      // setState(() {
                      //   status = val;
                      // });
                    },
                  ),
                ),
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
                      Icons.animation,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Animations")
                  ],
                ),
                Obx(
                  () => FlutterSwitch(
                    activeColor: color.primaryColor,
                    activeToggleColor: color.backgroundColor,

                    width: 50.0,
                    height: 25.0,
                    valueFontSize: 15.0,
                    toggleSize: 20.0,
                    value: switchController.AnimationSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.AnimationSwichChange.value == true
                          ? switchController.AnimationSwichChange.value = false
                          : switchController.AnimationSwichChange.value = true;
                      // status = val;
                      // setState(() {
                      //   status = val;
                      // });
                    },
                  ),
                ),
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
                      Icons.star_outline_sharp,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Show awards")
                  ],
                ),
                Obx(
                  () => FlutterSwitch(
                    activeColor: color.primaryColor,
                    activeToggleColor: color.backgroundColor,

                    width: 50.0,
                    height: 25.0,
                    valueFontSize: 15.0,
                    toggleSize: 20.0,
                    value: switchController.AwardsSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.AwardsSwichChange.value == true
                          ? switchController.AwardsSwichChange.value = false
                          : switchController.AwardsSwichChange.value = true;
                      // status = val;
                      // setState(() {
                      //   status = val;
                      // });
                    },
                  ),
                ),
              ],
            ),
            SH.medium(),
            SH.large(),
          ],
        ),
      )),
    );
  }
}
