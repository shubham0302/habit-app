// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

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
                const HeadingText(text: "Lock"),
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
                      Icons.lock_person,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Lock pin")
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
                    value: switchController.LockPinSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.LockPinSwichChange.value == true
                          ? switchController.LockPinSwichChange.value = false
                          : switchController.LockPinSwichChange.value = true;
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
                      Icons.fingerprint_sharp,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Enable fingerprint support")
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
                    value: switchController.FingerSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.FingerSwichChange.value == true
                          ? switchController.FingerSwichChange.value = false
                          : switchController.FingerSwichChange.value = true;
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
