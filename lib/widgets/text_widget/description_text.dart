import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/responsive_text.dart';
import 'package:habbit_app/widgets/theme_config.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final Color? color;
  final TextAlign? alignment;
  final String? type;
  final bool? isDotDot;
  const DescriptionText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.type,
      this.color,
      this.isDotDot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextSizeResponsive(
      string: text,
      color: color ?? ThemeConfig.mainTextColor,
      size: ThemeConfig.descriptionSize,
      weight: FontWeight.normal,
      alignment: alignment,
      style: type == 'i' ? 'i' : null,
      isDotDot: isDotDot,
    );
  }
}
