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

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: color.backgroundColor,
                content: Container(
                  width: 220,
                  // height: 290,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: LabelText(
                          text: "Contact us".tr,
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
                            child: LabelText(
                                text: "CONTACT SUPPORT".tr, isBold: true)),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                              SuggestionSupportCustomDialogBox(context);
                            },
                            child: LabelText(
                                text: "SEND SUGGESTIONS".tr, isBold: true)),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                              ReportSupportCustomDialogBox(context);
                            },
                            child: LabelText(
                                text: "REPORT A BUG".tr, isBold: true)),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                              ReminderSupportCustomDialogBox(context);
                            },
                            child: LabelText(
                              text: "REMINDER ARE NOT WORKING".tr,
                              isBold: true,
                            )),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: LabelText(
                              text: "CLOSE".tr, isColor: true, isBold: true
                              // color: color.primaryColor,
                              ),
                        ),
                        SH.medium(),
                      ]),
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  // return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Container(
  //       width: 220,
  //       // height: 290,
  //       child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Center(
  //                 child: LabelText(
  //               text: "Contact us".tr,
  //               isColor: true,
  //               color: color.disabledColor,
  //             )),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                   ContactSupportCustomDialogBox(context);
  //                 },
  //                 child: LabelText(
  //                     text: "CONTACT SUPPORT".tr, isBold: true)),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                   SuggestionSupportCustomDialogBox(context);
  //                 },
  //                 child: LabelText(
  //                     text: "SEND SUGGESTIONS".tr, isBold: true)),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                   ReportSupportCustomDialogBox(context);
  //                 },
  //                 child:
  //                     LabelText(text: "REPORT A BUG".tr, isBold: true)),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                   ReminderSupportCustomDialogBox(context);
  //                 },
  //                 child: LabelText(
  //                   text: "REMINDER ARE NOT WORKING".tr,
  //                   isBold: true,
  //                 )),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             GestureDetector(
  //               onTap: () {
  //                 Get.back();
  //               },
  //               child: LabelText(
  //                   text: "CLOSE".tr, isColor: true, isBold: true
  //                   // color: color.primaryColor,
  //                   ),
  //             ),
  //             SH.medium(),
  //           ]),
  //     ));
  // }
  // );
}
