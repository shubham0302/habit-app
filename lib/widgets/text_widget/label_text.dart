import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final bool? isWhite;
  final bool? isBold;
  final TextAlign? alignment;
  final bool? isDotDot;
  final bool? isColor;
  final Color? color;

  final bool? isNormal;
  const LabelText(
      {Key? key,
      required this.text,
      this.alignment,
      this.isWhite,
      this.isNormal,
      this.isBold=false,
      this.isDotDot,this.color,this.isColor,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    return Text(
      text,
      style: color.textTheme.bodyText1!.copyWith(color:isColor==true? (this.color ?? color.primaryColor) :null,fontWeight: isBold==true?FontWeight.bold:FontWeight.normal),
      textAlign: alignment,
    );
  }
}
