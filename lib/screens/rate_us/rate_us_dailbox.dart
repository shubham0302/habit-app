// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/rate_us/love_it_dailog.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:lottie/lottie.dart';

void RateUsCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Container(
              width: 260,
              height: 180,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: DescriptionText(text: "Notice about reminders")),
                    SH.medium(),
                    const Divider(),
                    SH.large(),
                    Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/images/heart.png',
                          fit: BoxFit.fill,
                        )),
                    SH.large(),
                    Divider(),
                    SH.medium(),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              child: LabelText(
                                text: "NOT REALLY",
                                isBold: true,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                LoveItCustomDialogBox(context);
                              },
                              child: Container(
                                child: LabelText(
                                  text: "LOVE IT!",
                                  isBold: true,
                                  isColor: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ));
      });
}
