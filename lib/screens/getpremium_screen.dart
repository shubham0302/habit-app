// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/button_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class GetPremiumScreen extends StatelessWidget {
  const GetPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                              color: color.primaryColor,
                            ),
                          )),
                      SW.medium(),
                      const MainLabelText(text: 'Get Premium'),
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
                    const HeadingText(
                      text: 'Get Premium',
                      alignment: TextAlign.center,
                    ),
                    SH.large(),
                    const Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: LabelText(
                        text:
                            'Take your productivity to the next level with Plannarize Premium',
                        alignment: TextAlign.center,
                      ),
                    ),
                    SH.medium(),
                    SH.small(),
                    Container(
                      height: 140,
                      width: 190,
                      decoration: BoxDecoration(
                          color: color.disabledColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LabelText(text: "One time purchase plan"),
                          SH.medium(),
                          SH.small(),
                          const LabelText(text: "SAVE 50%", isColor: true),
                          SH.small(),
                          const HeadingText(text: "???300.00"),
                          SH.small(),
                          const DescriptionText(text: "Price: ???890.00")
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
                          size: 30,
                        ),
                        SW.medium(),
                        const LabelText(text: "Track unlimited habits")
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 30,
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
                          size: 30,
                        ),
                        SW.medium(),
                        const LabelText(text: "Ultra dark theme")
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 30,
                        ),
                        SW.medium(),
                        const LabelText(
                            text:
                                "Mark your progress directly on the list widget")
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 30,
                        ),
                        SW.medium(),
                        const LabelText(
                            text: "Fingerprint support for lock screen")
                      ],
                    ),
                    SH.medium(),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: color.primaryColor,
                          size: 30,
                        ),
                        SW.medium(),
                        const LabelText(text: "Premium accent colors")
                      ],
                    ),
                    SH.large(),
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: color.primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: ButtonText(
                        text: "GET PREMIUM",
                      )),
                    ),
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
