// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/lockpin_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void LockPinCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        LockPinController lockPinController =
            Get.put(LockPinController(), permanent: false);
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Container(
              width: 280,
              height: 320,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: LabelText(text: "Set Lock Pin")),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    const LabelText(text: "Set Pin"),
                    SH.medium(),
                    InputField(
                      hintText: "Enter Pin",
                      controller: lockPinController.pinSetCtrl,
                      isWhiteHintText: true,
                      textType: TextInputType.phone,
                      onChange: (p0) {
                        lockPinController.setpin.value = p0;
                      },
                    ),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    const LabelText(text: "Confirm Pin"),
                    SH.medium(),
                    InputField(
                      hintText: "Re-enter Pin",
                      controller: lockPinController.pinconfirmCtrl,
                      isWhiteHintText: true,
                      textType: TextInputType.phone,
                      onChange: (p0) {
                        lockPinController.confirmpin.value = p0;
                      },
                    ),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.medium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            lockPinController.addPin();
                            Get.back();
                          },
                          child: const MainLabelText(
                            text: "Set Pin",
                            isColor: true,
                            isBold: true,
                          ),
                        ),
                        SW.large()
                      ],
                    )
                  ]),
            ));
      });
}
