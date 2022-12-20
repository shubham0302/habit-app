// ignore_for_file: file_names, unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/intro_screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class BackUpScreen extends StatelessWidget {
  const BackUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    // bool status = true;
    ThemeData color = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    ThemeController themeController = Get.find<ThemeController>();
    PageCntrl pageCntrl = Get.put(PageCntrl());
    return Scaffold(
      body: SafeArea(
        child: GlobalPadding(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const MainLabelText(text: 'Backups'),
                  ],
                ),
                // Icon(
                //   Icons.brush,
                //   size: 20,
                //   color: color.backgroundColor,
                // ),
              ],
            ),
            SH.large(),
            SH.large(),
            SH.large(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: color.disabledColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.backup,
                        size: 50,
                        color: color.primaryColor,
                      ),
                      // SH.small(),
                      const LabelText(text: "Upload\nBackup")
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: color.disabledColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_download,
                        size: 50,
                        color: color.primaryColor,
                      ),
                      // SH.small(),
                      const LabelText(text: "Import from\n     cloud")
                    ],
                  ),
                )
              ],
            ),
            SH.large(),
            SH.large(),
            const Divider(
              thickness: 0.5,
            ),
            SH.large(),
            SH.large(),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: color.primaryColor,
                  size: 20,
                ),
                SW.medium(),
                const LabelText(
                  text: "Cloud Backups Account",
                ),
                SW.medium(),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: LabelText(
                            text: "hello@gmail.com",
                          ),
                        )))
              ],
            ),
            SH.medium(),
            SH.small(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.update,
                      color: color.primaryColor,
                      size: 20,
                    ),
                    SW.medium(),
                    const LabelText(
                      text: "Automatic Cloud Backups",
                    ),
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
            SH.large(),
            SH.large(),
            const Divider(
              thickness: 0.5,
            ),
            SH.large(),
            SH.large(),
            Row(
              children: [
                Icon(
                  Icons.file_present_rounded,
                  color: color.primaryColor,
                  size: 20,
                ),
                SW.medium(),
                const LabelText(
                  text: "Create Backup File",
                ),
              ],
            ),
            SH.medium(),
            SH.small(),
            Row(
              children: [
                Icon(
                  Icons.data_saver_off_outlined,
                  color: color.primaryColor,
                  size: 20,
                ),
                SW.medium(),
                const LabelText(
                  text: "Import Backup File",
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
