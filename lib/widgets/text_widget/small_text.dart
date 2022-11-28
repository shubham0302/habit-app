import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

class SmallText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final bool? isSecondary;
  final TextAlign? alignment;

  final bool? isNormal;
  const SmallText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.isNormal,
      this.isSecondary});

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: isWhite == true
          ? ThemeConfig.whiteColor
          : isSecondary == true
              ? ThemeConfig.secondaryColor
              : ThemeConfig.mainTextColor,
      size: ThemeConfig.smallTextSize,
      weight: isNormal == true ? FontWeight.w100 : FontWeight.w800,
      alignment: alignment,
    );
  }
}
