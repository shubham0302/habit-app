// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/setting_screens/language_dailbox.dart';
import 'package:habbit_app/widgets/icon_widget.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: GlobalPadding(
        child: SingleChildScrollView(
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
                  const MainLabelText(text: 'Setting'),
                ],
              ),
              SH.large(),
              SH.large(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),
                onTap: () {
                  Get.toNamed("/todo");
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.list_alt,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          const LabelText(text: "Todo and Habit lists")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              // SH.medium(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),

                onTap: () {
                  Get.toNamed('/notiandalarm');
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.notifications_active,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          const LabelText(text: "Notifications and Alarms")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              // SH.medium(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),

                onTap: () {
                  Get.toNamed('/customize');
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.format_paint_outlined,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          const LabelText(text: "Customize")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              // SH.medium(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),

                onTap: () {
                  Get.toNamed("/lock");
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.screen_lock_portrait_outlined,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          const LabelText(text: "Lock Screen")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              // SH.medium(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),
                onTap: () {
                  Get.toNamed('/backup');
                },
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.backup_sharp,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          const LabelText(text: "Backups")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              // SH.medium(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),

                onTap: () {
                  LanguageCustomDialogBox(context);
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          LabelText(text: "lang".tr)
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              // SH.medium(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: color.primaryColor,
                highlightColor: color.primaryColor.withOpacity(0.5),

                onTap: () {
                  Get.toNamed('/lic');
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.list_alt_outlined,
                            size: 30,
                            color: color.primaryColor,
                          ),
                          SW.large(),
                          const LabelText(text: "Licenses")
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: color.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              // SH.medium(),
              const Divider(
                thickness: 1,
              ),
              SH.medium(),
              // IconWidgetClassic(
              //   iconColor: color.canvasColor,
              //   contanerColor: color.primaryColor,
              //   icon: Icons.account_balance_rounded,
              //   contanerHight: 100,
              //   contanerWidth: 100,
              //   contanerSize: true,
              // ),
              // SH.large(),
              // IconWidgetSimple(
              //   iconColor: color.primaryColor,
              //   contanerColor: color.primaryColor,
              //   icon: Icons.account_balance_rounded,
              //   contanerHight: 100,
              //   contanerWidth: 100,
              //   contanerSize: true,
              // )
            ],
          ),
        ),
      )),
    );
  }
}
