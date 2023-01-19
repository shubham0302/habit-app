// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:url_launcher/url_launcher.dart';

void LoveItCustomDialogBox(BuildContext context) {
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
                    Center(
                        child: LabelText(
                      text: "Notice about reminders".tr,
                      isColor: true,
                      color: color.disabledColor,
                    )),
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
                      text: "Your 5 stars would be of great help!".tr,
                      isColor: true,
                    ),
                    SH.small(),
                    DescriptionText(text: "It only takes a minute".tr),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.back();
                              },
                              child: Container(
                                child: LabelText(
                                  text: "MAYBE LATER".tr,
                                  isBold: true,
                                ),
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
                                  text: "RATE US!".tr,
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
