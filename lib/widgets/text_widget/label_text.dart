import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

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
    return TextSizeResponsive(
      string: text,
      color: isWhite == true
          ? ThemeConfig.whiteColor
          : isSecondary == true
              ? ThemeConfig.secondaryColor
              : ThemeConfig.mainTextColor,
      size: ThemeConfig.labelSize,
      weight: isNormal == true ? FontWeight.w300 : FontWeight.w800,
      alignment: alignment,
      isDotDot: isDotDot == true ? true : false,
    );
  }
}
