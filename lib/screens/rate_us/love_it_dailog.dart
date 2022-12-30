// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

void LoveItCustomDialogBox(BuildContext context) {
  final Uri _url =
      Uri.parse('https://play.google.com/store/apps/details?id=com.habitnow');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

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
                    Container(
                        height: 50,
                        width: 120,
                        child: Image.asset(
                          'assets/images/5star.png',
                          fit: BoxFit.fitWidth,
                        )),
                    LabelText(
                      text: "Your 5 stars would be of great help!",
                      isColor: true,
                    ),
                    SH.small(),
                    DescriptionText(text: "It only takes a minute"),
                    SH.medium(),
                    Divider(),
                    SH.medium(),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              child: LabelText(
                                text: "MAYBE LATER",
                                isBold: true,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                if (Platform.isAndroid || Platform.isIOS) {
                                  final appId = Platform.isAndroid
                                      ? 'com.habitnow'
                                      : '1640038993';
                                  final url = Uri.parse(
                                    Platform.isAndroid
                                        ? "market://details?id=$appId"
                                        : "https://apps.apple.com/app/id$appId",
                                  );
                                  launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: Container(
                                child: LabelText(
                                  text: "RATE US!",
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
