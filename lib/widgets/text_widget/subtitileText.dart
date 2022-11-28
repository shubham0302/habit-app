import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool? isDotDot;
  const SubTitleText(
      {Key? key, required this.text, this.alignment, this.isDotDot = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: ThemeConfig.mainTextColor,
      size: ThemeConfig.subtitleSize,
      weight: FontWeight.w900,
      alignment: alignment,
      isDotDot: isDotDot,
    );
  }
}
