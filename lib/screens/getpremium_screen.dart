// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/screens/customize_screen/components/premium_color_customize.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class GetPremiumScreen extends StatelessWidget {
  const GetPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PremiumController premiumController =
        Get.put(PremiumController(), permanent: false);
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GlobalPadding(
          // padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (() {
                            Get.back();
                          }),
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: color.primaryColorLight,
                            ),
                          )),
                      SW.medium(),
                      MainLabelText(text: 'Get Premium'.tr),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    SH.medium(),
                    SH.medium(),
                    Icon(
                      Icons.currency_exchange_rounded,
                      size: 100,
                      color: color.primaryColor,
                    ),
                    SH.medium(),
                    SH.large(),
                    HeadingText(
                      text: 'Get Premium'.tr,
                      alignment: TextAlign.center,
                    ),
                    SH.large(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: LabelText(
                        text:
                            'Take your productivity to the next level with Plannarize Premium'
                                .tr,
                        alignment: TextAlign.center,
                      ),
                    ),
                    SH.medium(),
                    SH.small(),
                    Container(
                      height: 140,
                      width: 190,
                      decoration: BoxDecoration(
                          color: color.disabledColor.withOpacity(.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LabelText(
                            text: "One time purchase plan".tr,
                            isColor: true,
                            color: Colors.white,
                          ),
                          SH.medium(),
                          SH.small(),
                          LabelText(text: "SAVE 50%".tr, isColor: true),
                          SH.small(),
                          const HeadingText(
                              text: "₹300.00",
                              isColor: true,
                              color: Colors.white),
                          SH.small(),
                          DescriptionText(
                              text: "Price: ₹890.00".tr,
                              isColor: true,
                              color: Colors.white)
                        ],
                      ),
                    ),
                    SH.large(),
                    SH.large(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 23,
                        ),
                        SW.medium(),
                        LabelText(text: "Track unlimited habits".tr)
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 23,
                        ),
                        SW.medium(),
                        const LabelText(
                            text: "Create unlimited recurring tasks")
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 23,
                        ),
                        SW.medium(),
                        LabelText(text: "Ultra dark theme".tr)
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 23,
                        ),
                        SW.medium(),
                        LabelText(
                            text:
                                "Mark your progress directly on the list widget"
                                    .tr)
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 23,
                        ),
                        SW.medium(),
                        LabelText(
                            text: "Fingerprint support for lock screen".tr)
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 23,
                        ),
                        SW.medium(),
                        LabelText(text: "Premium accent colors".tr)
                      ],
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          premiumController.premium.value == false
                              ? premiumController.premium.value = true
                              : premiumController.premium.value = false;
                          premiumController.setPremium();
                          print(premiumController.premium.value);
                        },
                        child:
                            Obx(() => premiumController.premium.value == false
                                ? Container(
                                    height: 50,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        color: color.primaryColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        child: MainLabelText(
                                      text: "GET PREMIUM".tr,
                                      color: Colors.white,
                                      isColor: true,
                                    )),
                                  )
                                : Container(
                                    height: 50,
                                    width: 320,
                                    child: Column(children: [
                                      LabelText(
                                          text:
                                              'You are already a premium user'),
                                      SH.medium(),
                                      LabelText(
                                        text:
                                            'Thank you for supporting our work!',
                                        isColor: true,
                                      )
                                    ]),
                                  ))),
                  ]),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
