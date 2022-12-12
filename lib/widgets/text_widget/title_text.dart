import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool? isDotDot;
  const TitleText(
      {Key? key, required this.text, this.alignment, this.isDotDot = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final sizeHeight = MediaQuery.of(context).size.height;
    ThemeData color = Theme.of(context);
    // ignore: unused_local_variable
    ThemeController themeController = Get.find<ThemeController>();
    return Text(
      text,
      style: color.textTheme.headline2,
      textAlign: alignment,
    );
  }
}
