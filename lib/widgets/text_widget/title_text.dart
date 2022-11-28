import 'package:flutter/material.dart';

import '../responsive_text.dart';
import '../theme_config.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool? isDotDot;
  const TitleText(
      {Key? key, required this.text, this.alignment, this.isDotDot = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: ThemeConfig.mainTextColor,
      size: ThemeConfig.titleSize,
      weight: FontWeight.w900,
      alignment: alignment,
      isDotDot: isDotDot,
    );
  }
}
