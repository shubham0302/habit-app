// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/lockpin_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void LockPinCustomDialogBox(BuildContext context) {
  LockPinController lockPinController =
      Get.put(LockPinController(), permanent: false);
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
                    height: 320,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: LabelText(text: "Set Lock Pin".tr)),
                          SH.large(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.large(),
                          LabelText(text: "Set Pin".tr),
                          SH.medium(),
                          InputField(
                            hintText: "Enter Pin".tr,
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
                          LabelText(text: "Confirm Pin".tr),
                          SH.medium(),
                          InputField(
                            hintText: "Re-enter Pin".tr,
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
                                child: MainLabelText(
                                  text: "Set Pin".tr,
                                  isColor: true,
                                  isBold: true,
                                ),
                              ),
                              SW.large()
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

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //   return AlertDialog(
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //       backgroundColor: color.backgroundColor,
  //       content: Container(
  //         width: 280,
  //         height: 320,
  //         child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Center(child: LabelText(text: "Set Lock Pin".tr)),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               LabelText(text: "Set Pin".tr),
  //               SH.medium(),
  //               InputField(
  //                 hintText: "Enter Pin".tr,
  //                 controller: lockPinController.pinSetCtrl,
  //                 isWhiteHintText: true,
  //                 textType: TextInputType.phone,
  //                 onChange: (p0) {
  //                   lockPinController.setpin.value = p0;
  //                 },
  //               ),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               LabelText(text: "Confirm Pin".tr),
  //               SH.medium(),
  //               InputField(
  //                 hintText: "Re-enter Pin".tr,
  //                 controller: lockPinController.pinconfirmCtrl,
  //                 isWhiteHintText: true,
  //                 textType: TextInputType.phone,
  //                 onChange: (p0) {
  //                   lockPinController.confirmpin.value = p0;
  //                 },
  //               ),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.medium(),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       lockPinController.addPin();
  //                       Get.back();
  //                     },
  //                     child: MainLabelText(
  //                       text: "Set Pin".tr,
  //                       isColor: true,
  //                       isBold: true,
  //                     ),
  //                   ),
  //                   SW.large()
  //                 ],
  //               )
  //             ]),
  //       ));
  // });
}
