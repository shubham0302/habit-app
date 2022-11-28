import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import '../responsive_text.dart';
import '../theme_config.dart';

class LabelText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final bool? isSecondary;
  final TextAlign? alignment;
  final bool? isDotDot;

  final bool? isNormal;
  const LabelText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.isNormal,
      this.isSecondary,
      this.isDotDot});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return Obx(
      () => TextSizeResponsive(
        string: text,
        color: isWhite == true
            ? ThemeConfig.whiteColor
            : isSecondary == true
                ? ThemeConfig.secondaryColor
                : themeController.isDark.value == true
                    ? ThemeConfig.mainTextColor
                    : ThemeConfig.mainTextColorLight,
        size: ThemeConfig.labelSize,
        weight: isNormal == true ? FontWeight.w400 : FontWeight.w800,
        alignment: alignment,
        isDotDot: isDotDot == true ? true : false,
      ),
    );
  }
}
