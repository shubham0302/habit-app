import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final bool? isWhite;
  const HeadingText(
      {Key? key, required this.text, this.alignment, this.isWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: isWhite! ? ThemeConfig.whiteColor : ThemeConfig.mainTextColor,
      size: ThemeConfig.headingSize,
      weight: FontWeight.bold,
      alignment: alignment,
    );
  }
}
