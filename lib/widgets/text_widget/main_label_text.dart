import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

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
    return TextSizeResponsive(
      string: text,
      color: color ?? ThemeConfig.mainTextColor,
      size: ThemeConfig.mainLabelSize,
      weight: isBold == true ? FontWeight.bold : FontWeight.normal,
      alignment: alignment,
      isDotDot: isDotDot == true ? true : false,
    );
  }
}
