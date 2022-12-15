import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final Color? color;
  final TextAlign? alignment;
  final String? type;
  final bool? isDotDot;
  final bool? isColor;
  const ButtonText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.type,
      this.color,
      this.isDotDot,
      this.isColor})
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
      style: color.textTheme.button!.copyWith(
        color: isColor == true ? (this.color ?? color.primaryColor) : null,
      ),
      textAlign: alignment,
    );
  }
}
