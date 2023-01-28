// ignore_for_file: sized_box_for_whitespace, unrelated_type_equality_checks, duplicate_ignore, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';

import 'dart:math' as math;

import 'package:habbit_app/widgets/text_widget/heading_text.dart';

import '../widgets/text_widget/main_label_text.dart';
import '../widgets/theme_config.dart';

class PageCntrl extends GetxController {
  var selectedIndex = 0.obs;
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    List<String> images = [
      'assets/images/Logo.png',
      'assets/images/calendar.png',
      'assets/images/tasks.png',
      'assets/images/statistics.png',
      'assets/images/paintBrush.png'
    ];
    Size size = MediaQuery.of(context).size;
    ThemeController themeController = Get.find<ThemeController>();
    PageCntrl pageCntrl = Get.put(PageCntrl());
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            PageView(
              // allowImplicitScrolling: true,

              onPageChanged: ((value) {
                pageCntrl.selectedIndex.value = value;
              }),
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * .2,
                        // bottom: 0,
                        // right: -50,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width,
                          height: 250,
                          child: Image.asset(
                            images[0],
                            width: size.width,
                          ),
                        )),
                  ]),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * .2,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width,
                            height: 250,
                            child: Image.asset(
                              images[1],
                              width: 200,
                            ),
                          ),
                        ))
                  ]),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          // bottom: 0,
                          // right: 0,
                          top: MediaQuery.of(context).size.height * .2,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width,
                              height: 250,
                              child: Image.asset(
                                images[2],
                                width: size.width,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * .2,
                        // bottom: 0,
                        // right: -50,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width,
                          height: 250,
                          child: Image.asset(
                            images[3],
                            width: size.width,
                          ),
                        )),
                  ]),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * .2,
                        // bottom: 0,
                        // right: -50,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width,
                          height: 250,
                          child: Image.asset(
                            images[4],
                            width: size.width,
                          ),
                        )),
                  ]),
                ),
              ],
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .55,
                  // left: 30,
                  // right: 100,
                ),
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.all(35),
                        duration: const Duration(milliseconds: 500),
                        child: IndexedStack(
                          index: pageCntrl.selectedIndex.value,
                          children: [
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  text: 'Welcome to Plannarize'.tr,
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                DescriptionText(
                                  text:
                                      'This app will help you to keep an organised routine as you build new habits!'
                                          .tr,
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  text: 'Create a routine'.tr,
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                DescriptionText(
                                  text:
                                      'To start using Plannarize record the habits you want to keep track in your life together with your pending tasks.'
                                          .tr,
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  text: 'Check it dailly'.tr,
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                DescriptionText(
                                  text:
                                      'A list shown every day with all your scheduled activities. Take advantage of customisable reminders to complete then all!'
                                          .tr,
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  text: 'Keep doing it!'.tr,
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                DescriptionText(
                                  text:
                                      'Create streaks of success for your habits and complete all your tasks. Use the charts and tools to deeply analyse your progress.'
                                          .tr,
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  text: 'Make the app yours'.tr,
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                DescriptionText(
                                  text:
                                      'Try all the customisation options create a daily journal and protect your data. There are many features to discover!'
                                          .tr,
                                  alignment: TextAlign.center,
                                ),
                                SH.large(),
                                // SH.large(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        themeController.changeThemeModeBy(
                                            CScreenLabels
                                                .oprionsForBrightness[1]);
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: Row(
                                        children: [
                                          DescriptionText(
                                            text: 'Dark Theme'.tr,
                                            isColor: true,
                                            color:
                                                themeController.themeModeData[
                                                            'value'] ==
                                                        'dark'
                                                    ? color.primaryColor
                                                    : color.disabledColor,
                                            isBold:
                                                themeController.themeModeData[
                                                            'value'] ==
                                                        'dark'
                                                    ? true
                                                    : false,
                                          ),
                                          SW.medium(),
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: themeController
                                                                  .themeModeData[
                                                              'value'] ==
                                                          'dark'
                                                      ? color.primaryColor
                                                          .withOpacity(.1)
                                                      : color.backgroundColor,
                                                  border: Border.all(
                                                      color: color.primaryColor,
                                                      width: themeController
                                                                      .themeModeData[
                                                                  'value'] ==
                                                              'dark'
                                                          ? 3
                                                          : 2)),
                                              child: Icon(
                                                themeController.themeModeData[
                                                            'value'] ==
                                                        'dark'
                                                    ? Icons.nightlight
                                                    : Icons.nightlight_outlined,
                                                color: color.primaryColor,
                                                size: 30,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SW.large(),
                                    GestureDetector(
                                      onTap: () {
                                        themeController.changeThemeModeBy(
                                            CScreenLabels
                                                .oprionsForBrightness[0]);
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: themeController
                                                                  .themeModeData[
                                                              'value'] ==
                                                          'dark'
                                                      ? color.backgroundColor
                                                      : color.primaryColor
                                                          .withOpacity(.1),
                                                  border: Border.all(
                                                      color: color.primaryColor,
                                                      width: themeController
                                                                      .themeModeData[
                                                                  'value'] ==
                                                              'dark'
                                                          ? 2
                                                          : 3)
                                                  // border: Border.all(
                                                  //     color: color.primaryColor,
                                                  //     width: 2)
                                                  ),
                                              child: Icon(
                                                themeController.themeModeData[
                                                            'value'] ==
                                                        'dark'
                                                    ? Icons.light_mode_outlined
                                                    : Icons.light_mode,
                                                color: color.primaryColor,
                                                size: 30,
                                              )),
                                          SW.medium(),
                                          DescriptionText(
                                              text: 'Light Theme'.tr,
                                              isColor: true,
                                              color:
                                                  themeController.themeModeData[
                                                              'value'] ==
                                                          'dark'
                                                      ? color.disabledColor
                                                      : color.primaryColor,
                                              isBold:
                                                  themeController.themeModeData[
                                                              'value'] ==
                                                          'dark'
                                                      ? false
                                                      : true)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                // SH.large(),
                                // // SH.medium(),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       color: color.disabledColor,
                                //       borderRadius: const BorderRadius.all(
                                //           Radius.circular(5))),
                                //   child: const Padding(
                                //     padding: EdgeInsets.all(3.0),
                                //     child: DescriptionText(
                                //       text: '30+ color themes',
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        // width: pageCntrl.selectedIndex.value == 2 ? 250 : 100,
                        width: size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.offAllNamed('/home');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  // width: 50,
                                  // color: color.indicatorColor,
                                  child: MainLabelText(
                                    text: 'Skip'.tr,
                                    isBold: true,
                                    alignment: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                alignment: Alignment.centerLeft,
                                width: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        height: 10,
                                        // ignore: unrelated_type_equality_checks
                                        width: 10,
                                        // pageCntrl.selectedIndex == 0
                                        //     ? 15
                                        //     : 10,
                                        decoration: BoxDecoration(
                                            // ignore: unrelated_type_equality_checks
                                            color: pageCntrl.selectedIndex == 0
                                                ? color.indicatorColor
                                                : color.backgroundColor,
                                            borderRadius: BorderRadius.circular(
                                                ThemeConfig.radiusMid),
                                            border: Border.all(
                                                width: 1,
                                                color: color.indicatorColor))),
                                    SW.small(),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 10,
                                      // ignore: unrelated_type_equality_checks
                                      width: 10,
                                      // pageCntrl.selectedIndex == 1
                                      //     ? 15
                                      //     : 10,
                                      decoration: BoxDecoration(
                                          // ignore: unrelated_type_equality_checks
                                          color: pageCntrl.selectedIndex == 1
                                              ? color.indicatorColor
                                              : color.backgroundColor,
                                          borderRadius: BorderRadius.circular(
                                              ThemeConfig.radiusMid),
                                          border: Border.all(
                                              width: 1,
                                              color: color.indicatorColor)),
                                    ),
                                    SW.small(),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 10,
                                      // ignore: unrelated_type_equality_checks
                                      width: 10,
                                      // pageCntrl.selectedIndex == 2
                                      //     ? 15
                                      //     : 10,
                                      decoration: BoxDecoration(
                                          // ignore: unrelated_type_equality_checks
                                          color: pageCntrl.selectedIndex == 2
                                              ? color.indicatorColor
                                              : color.backgroundColor,
                                          borderRadius: BorderRadius.circular(
                                              ThemeConfig.radiusMid),
                                          border: Border.all(
                                              width: 1,
                                              color: color.indicatorColor)),
                                    ),
                                    SW.small(),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 10,
                                      // ignore: unrelated_type_equality_checks
                                      width: 10,
                                      // pageCntrl.selectedIndex == 3
                                      //     ? 15
                                      //     : 10,
                                      decoration: BoxDecoration(
                                          // ignore: unrelated_type_equality_checks
                                          color: pageCntrl.selectedIndex == 3
                                              ? color.indicatorColor
                                              : color.backgroundColor,
                                          borderRadius: BorderRadius.circular(
                                              ThemeConfig.radiusMid),
                                          border: Border.all(
                                              width: 1,
                                              color: color.indicatorColor)),
                                    ),
                                    SW.small(),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 10,
                                      // ignore: unrelated_type_equality_checks
                                      width: 10,
                                      // pageCntrl.selectedIndex == 4
                                      //     ? 15
                                      //     : 10,
                                      decoration: BoxDecoration(
                                          // ignore: unrelated_type_equality_checks
                                          color: pageCntrl.selectedIndex == 4
                                              ? color.indicatorColor
                                              : color.backgroundColor,
                                          borderRadius: BorderRadius.circular(
                                              ThemeConfig.radiusMid),
                                          border: Border.all(
                                              width: 1,
                                              color: color.indicatorColor)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (pageCntrl.selectedIndex.value < 4) {
                                    pageCntrl.selectedIndex.value =
                                        pageCntrl.selectedIndex.value + 1;
                                  } else {
                                    Get.offAllNamed('/home');
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,

                                  // width: 50,
                                  // color: color.indicatorColor,
                                  // ignore: prefer_const_constructors
                                  child: MainLabelText(
                                    text: 'Next'.tr,
                                    isBold: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SH.large(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
