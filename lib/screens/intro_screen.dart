// ignore_for_file: sized_box_for_whitespace, unrelated_type_equality_checks, duplicate_ignore

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
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [color.cardColor, color.primaryColor],
        //         begin: Alignment.bottomRight,
        //         end: Alignment.topLeft)),
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
                        top: 120,
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
                        top: 120,
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
                          top: 120,
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
                        top: 120,
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
                        top: 120,
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
                padding: const EdgeInsets.only(
                  top: 400,
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
                                const HeadingText(
                                  text: 'Welcome to Plannarize',
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                const DescriptionText(
                                  text:
                                      'This app will help you to keep an organised routine as you build new habits!',
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadingText(
                                  text: 'Create a routine',
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                const DescriptionText(
                                  text:
                                      'To start using Plannarize record the habits you want to keep track in your life together with your pending tasks.',
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadingText(
                                  text: 'Check it dailly',
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                const DescriptionText(
                                  text:
                                      'A list shown every day with all your scheduled activities. Take advantage of customisable reminders to complete then all!',
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadingText(
                                  text: 'Keep doing it!',
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                const DescriptionText(
                                  text:
                                      'Create streaks of success for your habits and complete all your tasks. Use the charts and tools to deeply analyse your progress.',
                                  alignment: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadingText(
                                  text: 'Make the app yours',
                                  alignment: TextAlign.center,
                                ),
                                SH.medium(),
                                const DescriptionText(
                                  text:
                                      'Try all the customisation options create a daily journal and protect your data. There are many features to discover!',
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
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: color.primaryColor,
                                                  width: 2)),
                                          child: Icon(
                                            Icons.nightlight_outlined,
                                            color: color.primaryColor,
                                            size: 30,
                                          )),
                                    ),
                                    SW.large(),
                                    GestureDetector(
                                      onTap: () {
                                        themeController.changeThemeModeBy(
                                            CScreenLabels
                                                .oprionsForBrightness[0]);
                                      },
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: color.primaryColor,
                                            // border: Border.all(
                                            //     color: color.primaryColor,
                                            //     width: 2)
                                          ),
                                          child: Icon(
                                            Icons.light_mode,
                                            color: color.backgroundColor,
                                            size: 30,
                                          )),
                                    )
                                  ],
                                ),
                                SH.large(),
                                // SH.medium(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: color.disabledColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: DescriptionText(
                                      text: '30+ color themes',
                                    ),
                                  ),
                                )
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                    child: const MainLabelText(
                                      text: 'Skip',
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
                                              color:
                                                  pageCntrl.selectedIndex == 0
                                                      ? color.indicatorColor
                                                      : color.backgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ThemeConfig.radiusMid),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      color.indicatorColor))),
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
                                      text: 'Next',
                                      isBold: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
