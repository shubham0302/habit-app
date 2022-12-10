import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/theme/color_scheme.dart';
import 'package:habbit_app/theme/theme_data.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/button_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();
    ThemeData color = Theme.of(context);
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SH.large(),
          SH.large(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: GlobalPadding(
              child: Row(
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        Get.back();
                      }),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      )),
                  SW.medium(),
                  const MainLabelText(text: 'Customize'),
                ],
              ),
            ),
          ),
          // SH.medium(),
          const Divider(),
          // SH.medium(),
          GlobalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelText(text: 'Theme'),
                GestureDetector(
                    onTap: () {
                      themeController.changeThemeMode();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: LabelText(
                        text:
                            themeController.isDark == true ? 'Dark' : 'Light')),
              ],
            ),
          ),
          // SH.medium(),
          const Divider(),
          GlobalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText(text: 'Use Ultro Dark Theme'),
                    DescriptionText(text: 'Only for premium users')
                  ],
                ),
                Switch(
                    // activeTrackColor: Colors.white,
                    value: themeController.isDark,
                    onChanged: (v) {
                      themeController.changeThemeMode();
                    }),
                // GestureDetector(
                //     onTap: () {
                //       themeController.changeThemeMode();
                //     },
                //     behavior: HitTestBehavior.translucent,
                //     child: LabelText(
                //         text:
                //             themeController.isDark == true ? 'Dark' : 'Light')),
              ],
            ),
          ),
          // SH.medium(),
        ],
      ),
    );
  }
}
