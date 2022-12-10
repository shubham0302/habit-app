import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

import '../../controllers/theme_controller.dart';

class MainLabelText extends StatelessWidget {
  final String text;
  final Color? color;
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
      this.isDotDot,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    ThemeData color = Theme.of(context);
    ThemeController themeController = Get.find<ThemeController>();
    return Text(
      text,
      style: color.textTheme.bodyText2,
      textAlign: alignment,
    );
  }
}
