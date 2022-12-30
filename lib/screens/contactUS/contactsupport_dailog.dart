// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/email_send_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

void ContactSupportCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        Future LaunchEmail({
          required String toEmail,
          required String toSubject,
          required String toMessage,
        }) async {
          final url1 =
              'mailto:$toEmail?subject=${Uri.encodeFull(toSubject)}&body=${Uri.encodeFull(toMessage)}';

          if (await canLaunchUrlString(url1)) {
            await launchUrlString(url1);
          }
        }

        EmailSendController emailSendController =
            Get.put(EmailSendController(), permanent: false);
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Container(
              width: 220,
              height: 220,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(child: DescriptionText(text: "Contact us")),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    InputField(
                      hintText: "Write your comments here",
                      isDescription: true,
                      controller: emailSendController.controllerMessage,
                    ),
                    SH.large(),
                    const DescriptionText(
                        text: "Your feedback is very valuable to us"),
                    SH.large(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const LabelText(
                            text: "CANCEL",
                            isBold: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            LaunchEmail(
                                toEmail: emailSendController.controllerTo,
                                toSubject:
                                    emailSendController.controllerSubject,
                                toMessage:
                                    emailSendController.controllerMessage.text);
                          },
                          child: const LabelText(
                            text: "SEND",
                            isColor: true,
                            isBold: true,
                          ),
                        )
                      ],
                    )
                  ]),
            ));
      });
}
