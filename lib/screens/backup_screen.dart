// ignore_for_file: file_names, unused_local_variable, depend_on_referenced_packages, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/intro_screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../controllers/premium_controller.dart';
import 'getPremium_dailbox.dart';

class BackUpScreen extends StatelessWidget {
  const BackUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PremiumController premiumController =
        Get.put(PremiumController(), permanent: false);
    DBController dbController = Get.find<DBController>();

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
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: color.primaryColor,
                          ),
                        )),
                    SW.medium(),
                    MainLabelText(text: 'Backups'.tr),
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: color.disabledColor.withOpacity(.3),
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
                        LabelText(
                          text: "Upload Backup".tr,
                          isBold: true,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: color.disabledColor.withOpacity(.3),
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
                      LabelText(
                        alignment: TextAlign.center,
                        text: "Import from cloud".tr,
                        isBold: true,
                      )
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(
                      text: "Cloud Backups Account".tr,
                    ),
                    premiumController.premium.value == false
                        ? DescriptionText(
                            text: 'Only for premium users',
                            isColor: true,
                          )
                        : SizedBox()
                  ],
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
                            color: color.disabledColor.withOpacity(.3)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: LabelText(
                            text: "hello@gmail.com",
                          ),
                        )))
              ],
            ),
            SH.large(),
            // SH.medium(),
            // SH.small(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.update,
                      color: color.primaryColor,
                      size: 20,
                    ),
                    SW.medium(),
                    LabelText(
                      text: "Automatic Cloud Backups".tr,
                    ),
                  ],
                ),
                Expanded(
                  child: Obx(
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          switchController.SwichChange.value == true
                              ? switchController.SwichChange.value = false
                              : switchController.SwichChange.value = true;
                        }
                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
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

            GestureDetector(
              onTap: () {
                dbController.appDB.exportInto('assets/my_database.db');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.file_present_rounded,
                    color: color.primaryColor,
                    size: 20,
                  ),
                  SW.medium(),
                  LabelText(
                    text: "Create Backup File".tr,
                  ),
                ],
              ),
            ),

            SH.large(),

            GestureDetector(
              onTap: () {
                dbController.appDB.importDB();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.data_saver_off_outlined,
                    color: color.primaryColor,
                    size: 20,
                  ),
                  SW.medium(),
                  LabelText(
                    text: "Import Backup File".tr,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
