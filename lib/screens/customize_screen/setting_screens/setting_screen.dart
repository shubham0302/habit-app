import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const HeadingText(text: "Setting"),
              ],
            ),
            SH.large(),
            SH.large(),
            GestureDetector(
              onTap: () {
                Get.toNamed("/todo");
              },
              child: Row(
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
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
            GestureDetector(
              onTap: () {
                Get.toNamed('/notiandalarm');
              },
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
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
            Row(
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
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
            GestureDetector(
              onDoubleTap: () {
                Get.toNamed("/lock");
              },
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
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
            Row(
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
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
            Row(
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
                    const LabelText(text: "Language")
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.primaryColor,
                )
              ],
            ),
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
            GestureDetector(
              onTap: () {
                Get.toNamed('/lic');
              },
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
            SH.medium(),
            const Divider(
              thickness: 1,
            ),
            SH.medium(),
          ],
        ),
      )),
    );
  }
}
