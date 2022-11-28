import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/theme_config.dart';
import '../responsive_text.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool? isWhite;
  const HeadingText(
      {Key? key, required this.text, this.alignment, this.isWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return Obx(
      () => TextSizeResponsive(
        string: text,
        color: isWhite!
            ? ThemeConfig.whiteColor
            : themeController.isDark.value == true
                ? ThemeConfig.mainTextColor
                : ThemeConfig.mainTextColorLight,
        size: ThemeConfig.headingSize,
        weight: FontWeight.bold,
        alignment: alignment,
      ),
    );
  }
}
