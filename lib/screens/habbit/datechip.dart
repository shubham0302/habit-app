import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/des_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class DateChip extends StatelessWidget {
  final String day;
  final String date;
  final bool? isColor;
  final Color? selectColor;
  final VoidCallback op;
  const DateChip(
      {super.key,
      required this.day,
      required this.date,
      this.isColor,
      this.selectColor,
      required this.op});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Expanded(
      child: GestureDetector(
        onTap: op,
        child: Container(
          child: Column(
            children: [
              DesText(
                text: day,
                isWhite: true,
              ),
              SH.small(),
              Container(
                // alignment: Alignment.center,
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            isColor != null ? selectColor! : Colors.transparent,
                        width: 2),
                    shape: BoxShape.circle,
                    color: isColor != null
                        ? selectColor!.withOpacity(.2)
                        : color.dialogBackgroundColor),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SH.small(),

                        // SH.medium(),
                        LabelText(
                          text: date,
                          isBold: true,
                          isWhite: true,
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
