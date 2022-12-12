import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool? isWhite;
  final bool? isColor;
  final Color? color;

  const HeadingText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite = false,
      this.isColor,
      this.color})
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
      style: color.textTheme.headline1,
      textAlign: alignment,
    );
  }
}
