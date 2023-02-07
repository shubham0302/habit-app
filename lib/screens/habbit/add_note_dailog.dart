// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/email_send_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

void addNoteCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        EmailSendController emailSendController =
            Get.put(EmailSendController(), permanent: false);
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
                    // height: 220,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(child: DescriptionText(text: "Add note".tr)),
                          SH.medium(),
                          const Divider(),
                          SH.medium(),
                          InputField(
                            hintText: "".tr,
                            isDescription: true,
                            // controller: emailSendController.controllerMessage,
                          ),
                          SH.large(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: LabelText(
                                  text: "CANCEL".tr,
                                  isBold: true,
                                ),
                              ),
                              GestureDetector(
                                child: LabelText(
                                  text: "SEND".tr,
                                  isColor: true,
                                  isBold: true,
                                ),
                              )
                            ],
                          )
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
}
