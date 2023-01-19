// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class BrightnessCustomize extends StatelessWidget {
  const BrightnessCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLight = true.obs;
    ThemeData color = Theme.of(context);
    ThemeController themeController = Get.find<ThemeController>();
    return GlobalPadding(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const LabelText(text: CScreenLabels.brightnessText),
          //     GestureDetector(
          //       onTap: () {
          //         showDialog(
          //           context: context,
          //           builder: (ctx) {
          //             return const AlertBoxCustomize();
          //           },
          //           barrierDismissible: true,
          //         );
          //         // AlertDialog(content: AlertBoxCustomize(),);
          //         // themeController.changeThemeMode();
          //       },
          //       behavior: HitTestBehavior.translucent,
          //       child: Obx(
          //         () => LabelText(
          //             text: themeController.themeModeData['label'].toString()),
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  isLight.value = true;
                  themeController
                      .changeThemeModeBy(CScreenLabels.oprionsForBrightness[0]);
                },
                child: Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 150,
                            // height: 130,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                // border:
                                //     Border.all(width: 1, color: Colors.white),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.grey.withOpacity(.9)),
                            child: GlobalPadding(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: color.primaryColor,
                                              ),
                                            ),
                                            SW.medium(),
                                            Expanded(
                                              child: Container(
                                                height: 15,
                                                // width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5)),
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SH.medium(),
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: color.primaryColor,
                                              ),
                                            ),
                                            SW.medium(),
                                            Expanded(
                                              child: Container(
                                                height: 15,
                                                // width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5)),
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                    ),
                                  ),
                                  SH.medium(),
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: color.primaryColor,
                                            ),
                                          ),
                                          SW.medium(),
                                          Expanded(
                                            child: Container(
                                              height: 15,
                                              // width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                  color: Colors.grey
                                                      .withOpacity(.5)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SH.large(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(text: "Light".tr),
                          SW.medium(),
                          Container(
                              padding: const EdgeInsets.all(2),
                              height: 19,
                              width: 19,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: color.primaryColor),
                                  borderRadius: BorderRadius.circular(22)),
                              child: themeController.themeModeData['label']
                                          .toString() ==
                                      'Light'
                                  ? Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: color.primaryColor),
                                      // child: Icon(Icons.arrow_forward_ios_rounded),
                                    )
                                  : Container()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SW.medium(),
              GestureDetector(
                onTap: () {
                  isLight.value = false;
                  themeController
                      .changeThemeModeBy(CScreenLabels.oprionsForBrightness[1]);
                },
                child: Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 150,
                            // height: 130,
                            // color: Colors.red,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.black),
                            child: GlobalPadding(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.grey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: color.primaryColor,
                                              ),
                                            ),
                                            SW.medium(),
                                            Expanded(
                                              child: Container(
                                                height: 15,
                                                // width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5)),
                                                    color: Colors.black
                                                        .withOpacity(0.6)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SH.medium(),
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: color.primaryColor,
                                              ),
                                            ),
                                            SW.medium(),
                                            Expanded(
                                              child: Container(
                                                height: 15,
                                                // width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5)),
                                                    color: Colors.black
                                                        .withOpacity(0.6)),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                    ),
                                  ),
                                  SH.medium(),
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.grey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: color.primaryColor,
                                            ),
                                          ),
                                          SW.medium(),
                                          Expanded(
                                            child: Container(
                                              height: 15,
                                              // width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                  color: Colors.black
                                                      .withOpacity(0.6)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SH.large(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(text: "Dark".tr),
                          SW.medium(),
                          Container(
                              padding: const EdgeInsets.all(2),
                              height: 19,
                              width: 19,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: color.primaryColor),
                                  borderRadius: BorderRadius.circular(22)),
                              child: themeController.themeModeData['label']
                                          .toString() ==
                                      'Dark'
                                  ? Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: color.primaryColor),
                                      // child: Icon(Icons.arrow_forward_ios_rounded),
                                    )
                                  : Container()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
