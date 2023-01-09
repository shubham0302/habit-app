// ignore_for_file: sized_box_for_whitespace, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/lockpin_controller.dart';

import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/custom_snackbar.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

import '../../widgets/text_widget/main_label_text.dart';
import '../pin/lock_pin_dailbox.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LockPinController lockPinController = Get.find<LockPinController>();
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const MainLabelText(text: 'Lock'),
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
                    value: lockPinController.lockType.value == 'pin' ||
                        lockPinController.lockType.value == 'bio',
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) async {
                      // switchController.LockPinSwichChange.value == true
                      //     ? switchController.LockPinSwichChange.value = false
                      //     : switchController.LockPinSwichChange.value = true;

                      // // switchController.LockPinSwichChange.value == true
                      // if (switchController.LockPinSwichChange.value) {
                      if (val) {
                        await lockPinController.changeTypeFromScreen(
                            'pin', context);
                        // LockPinCustomDialogBox(context);
                      } else {
                        await lockPinController.changeType('none');
                      }
                      // }
                      // : SizedBox();
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
                Obx(() => FlutterSwitch(
                      activeColor: color.primaryColor,
                      activeToggleColor: color.backgroundColor,

                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 20.0,
                      value: lockPinController.lockType.value == 'bio',
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        if (val) {
                          lockPinController.changeTypeFromScreen(
                              'bio', context);
                        } else {
                          lockPinController.changeType('pin');
                        }

                        // switchController.FingerSwichChange.value == true
                        //     ? switchController.FingerSwichChange.value =
                        //         false
                        //     : switchController.FingerSwichChange.value =
                        //         true;
                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    )),
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
