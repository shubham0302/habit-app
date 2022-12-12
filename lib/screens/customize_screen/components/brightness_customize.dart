import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/customize_screen/components/alertbox_customize.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class BrightnessCustomize extends StatelessWidget {
  const BrightnessCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();
    return GlobalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LabelText(text: CScreenLabels.brightnessText),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return const AlertBoxCustomize();
                },
                barrierDismissible: true,
              );
              // AlertDialog(content: AlertBoxCustomize(),);
              // themeController.changeThemeMode();
            },
            behavior: HitTestBehavior.translucent,
            child: Obx(
              () => LabelText(
                  text: themeController.themeModeData['label'].toString()),
            ),
          ),
        ],
      ),
    );
  }
}
