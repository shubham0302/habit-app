import 'package:flutter/material.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class AlertBoxCustomize extends StatelessWidget {
  const AlertBoxCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GlobalPadding(
              child: LabelText(
                text: CScreenLabels.brightnessText,
                isBold: false,
              ),
            ),
            const Divider(),
            ...CScreenLabels.oprionsForBrightness
                .map((e) => Column(
                      children: [
                        GlobalPadding(
                          child: LabelText(
                            text: e['label'].toString(),
                            isBold: true,
                          ),
                        ),
                        const Divider(),
                      ],
                    ))
                .toList(),
            const GlobalPadding(
              child: LabelText(
                text: CScreenLabels.closeButtonText,
                isColor: true,
                isBold: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
