import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

import '../../controllers/theme_controller.dart';

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
    final sizeHeight = MediaQuery.of(context).size.height;
    ThemeData color = Theme.of(context);
    ThemeController themeController = Get.find<ThemeController>();
    return Text(
      text,
      style: color.textTheme.bodyText1,
      textAlign: alignment,
    );
  }
}
