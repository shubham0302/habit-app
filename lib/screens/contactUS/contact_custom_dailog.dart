// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/contactUS/contactsupport_dailog.dart';
import 'package:habbit_app/screens/contactUS/reminder_dailbox.dart';
import 'package:habbit_app/screens/contactUS/report_dailog.dart';
import 'package:habbit_app/screens/contactUS/sendsuggestion_dailbox.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void ContactCustomDialogBox(BuildContext context) {
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
              width: 220,
              height: 290,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: LabelText(
                      text: "Contact us",
                      isColor: true,
                      color: color.disabledColor,
                    )),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          ContactSupportCustomDialogBox(context);
                        },
                        child: const LabelText(text: "CONTACT SUPPORT")),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          SuggestionSupportCustomDialogBox(context);
                        },
                        child: const LabelText(text: "SEND SUGGESTIONS")),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          ReportSupportCustomDialogBox(context);
                        },
                        child: const LabelText(text: "REPORT A BUG")),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                          ReminderSupportCustomDialogBox(context);
                        },
                        child:
                            const LabelText(text: "REMINDER ARE NOT WORKING")),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const LabelText(
                        text: "CLOSE",
                        isColor: true,
                        // color: color.primaryColor,
                      ),
                    ),
                    SH.medium(),
                  ]),
            ));
      });
}
