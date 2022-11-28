import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import '../responsive_text.dart';
import '../theme_config.dart';

class MainLabelText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final bool? isBold;
  final bool? isDotDot;

  final TextAlign? alignment;
  const MainLabelText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.isBold,
      this.isDotDot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return Obx(
      () => TextSizeResponsive(
        string: text,
        color: isWhite == true
            ? ThemeConfig.whiteColor
            : themeController.isDark.value == true
                ? ThemeConfig.mainTextColor
                : ThemeConfig.mainTextColorLight,
        size: ThemeConfig.mainLabelSize,
        weight: isBold == true ? FontWeight.bold : FontWeight.normal,
        alignment: alignment,
        isDotDot: isDotDot == true ? true : false,
      ),
    );
  }
}
