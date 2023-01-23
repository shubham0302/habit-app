// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void GetPremiumCustomDialogBox(BuildContext context) {
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
              // height: 380,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: DescriptionText(text: 'Get Premium')),
                    SH.medium(),
                    const Divider(),
                    SH.large(),
                    Text(
                      "Become premium to unlock this feature".tr,
                      style: TextStyle(fontSize: 15, color: color.canvasColor),
                      textAlign: TextAlign.center,
                    ),
                    SH.large(),
                    // Text(
                    //   'To register more, purchase the premium version or delete some(active or archived)',
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     color: color.canvasColor,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SH.large(),
                    // Text(
                    //   'Anyway, you can continue adding tasks.',
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     color: color.canvasColor,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SH.large(),
                    Divider(),
                    SH.large(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: LabelText(
                              text: 'CLOSE'.tr,
                              isColor: true,
                              // color: color.primaryColor,
                            )),
                        GestureDetector(
                            onTap: () {
                              Get.offNamed('/getpremium');
                            },
                            child: LabelText(
                              text: 'GET PREMIUM'.tr,
                              isColor: true,
                              // color: color.primaryColor,
                            )),
                      ],
                    )
                  ]),
            ));
      });
}
