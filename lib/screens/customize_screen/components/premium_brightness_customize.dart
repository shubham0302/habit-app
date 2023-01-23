import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/getPremium_dailbox.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class PrimumBrighnessCustomize extends StatelessWidget {
  const PrimumBrighnessCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    PremiumController premiumController =
        Get.put(PremiumController(), permanent: false);
    ThemeController themeController = Get.find<ThemeController>();
    return GlobalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(text: CScreenLabels.premiumBrightnessTitleText.tr),
              premiumController.premium.value == false
                  ? DescriptionText(
                      text: CScreenLabels.premiumBrightnessSubtitleText.tr)
                  : SizedBox()
            ],
          ),
          Obx(
            () => Switch(
                value: themeController.isDark,
                onChanged: (v) {
                  if (premiumController.premium.value == false) {
                    GetPremiumCustomDialogBox(context);
                  } else {
                    themeController.changeThemeMode();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
