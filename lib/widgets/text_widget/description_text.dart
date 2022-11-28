import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import '../responsive_text.dart';
import '../theme_config.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final Color? color;
  final TextAlign? alignment;
  final String? type;
  final bool? isDotDot;
  final bool? isBold;
  const DescriptionText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.type,
      this.color,
      this.isDotDot,
      this.isBold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return Obx(
      () => TextSizeResponsive(
        string: text,
        color: themeController.isDark.value == true
            ? ThemeConfig.mainTextColor
            : ThemeConfig.mainTextColorLight,
        size: ThemeConfig.descriptionSize,
        weight: FontWeight.normal,
        alignment: alignment,
        style: type == 'i' ? 'i' : null,
        isDotDot: isDotDot,
      ),
    );
  }
}
