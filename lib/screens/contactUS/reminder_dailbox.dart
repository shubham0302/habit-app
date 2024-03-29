// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:lottie/lottie.dart';

void ReminderSupportCustomDialogBox(BuildContext context) {
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
                    width: 280,
                    height: 380,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: DescriptionText(
                                  text: "Notice about reminders".tr)),
                          SH.medium(),
                          const Divider(),
                          // SH.medium(),
                          Lottie.asset('assets/lottie/bell.json',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                              repeat: false),
                          Text(
                            "Your device has an integrated battery optimizer that could disable scheduled alarms and notifications."
                                .tr,
                            style: TextStyle(
                                fontSize: 15, color: color.canvasColor),
                            textAlign: TextAlign.center,
                          ),
                          SH.large(),
                          Text(
                            "Make sure that HabitNow is excluded from your optimizer to ensure the correct execution of the reminders."
                                .tr,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SH.large(),
                          SH.large(),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: LabelText(
                                text: 'GOT IT!'.tr,
                                isColor: true,
                                // color: color.primaryColor,
                              ))
                        ]),
                  ))),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });
  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //           insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //           shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //           backgroundColor: color.backgroundColor,
  //           content: Container(
  //             width: 280,
  //             height: 380,
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Center(
  //                       child:
  //                           DescriptionText(text: "Notice about reminders".tr)),
  //                   SH.medium(),
  //                   const Divider(),
  //                   // SH.medium(),
  //                   Lottie.asset('assets/lottie/bell.json',
  //                       width: 150,
  //                       height: 150,
  //                       fit: BoxFit.cover,
  //                       repeat: false),
  //                   Text(
  //                     "Your device has an integrated battery optimizer that could disable scheduled alarms and notifications."
  //                         .tr,
  //                     style: TextStyle(fontSize: 15, color: color.canvasColor),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   SH.large(),
  //                   Text(
  //                     "Make sure that HabitNow is excluded from your optimizer to ensure the correct execution of the reminders."
  //                         .tr,
  //                     style: const TextStyle(
  //                       fontSize: 15,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   SH.large(),
  //                   SH.large(),
  //                   GestureDetector(
  //                       onTap: () {
  //                         Get.back();
  //                       },
  //                       child: LabelText(
  //                         text: 'GOT IT!'.tr,
  //                         isColor: true,
  //                         // color: color.primaryColor,
  //                       ))
  //                 ]),
  //           ));
  // });
}
