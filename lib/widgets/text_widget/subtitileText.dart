// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../responsive_text.dart';
import '../theme_config.dart';

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
