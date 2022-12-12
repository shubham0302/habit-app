import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      'assets/images/veg.jpeg',
      'assets/images/bakery.png',
      'assets/images/507.png'
    ];
    Size size = MediaQuery.of(context).size;

    PageCntrl pageCntrl = Get.put(PageCntrl());
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.cardColor, color.primaryColor],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)),
        child: Stack(
          children: [
            PageView(
              onPageChanged: ((value) {
                pageCntrl.selectedIndex.value = value;
              }),
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: 100,
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
                // ignore: sized_box_for_whitespace
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: 100,
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
                // ignore: sized_box_for_whitespace
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          // bottom: 0,
                          // right: 0,
                          top: 100,
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
              ],
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(
                  top: 470,
                  // left: 30,
                  // right: 100,
                ),
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: IndexedStack(
                        index: pageCntrl.selectedIndex.value,
                        children: [
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeadingText(
                                text: 'Welcome to Habit',
                                alignment: TextAlign.center,
                              ),
                              SH.medium(),
                              const DescriptionText(
                                text:
                                    'This app will help you to keep an organized routines as you build new habits',
                                alignment: TextAlign.center,
                              )
                            ],
                          ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeadingText(
                                text: 'Welcome to Habit',
                                alignment: TextAlign.center,
                              ),
                              SH.medium(),
                              const DescriptionText(
                                text:
                                    'This app will help you to keep an organized routines as you build new habits',
                                alignment: TextAlign.center,
                              )
                            ],
                          ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeadingText(
                                text: 'Welcome to Habit',
                                alignment: TextAlign.center,
                              ),
                              SH.medium(),
                              const DescriptionText(
                                text:
                                    'This app will help you to keep an organized routines as you build new habits',
                                alignment: TextAlign.center,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      // width: pageCntrl.selectedIndex.value == 2 ? 250 : 100,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/home');
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
                                width: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        height: 10,
                                        // ignore: unrelated_type_equality_checks
                                        width: pageCntrl.selectedIndex == 0
                                            ? 15
                                            : 10,
                                        decoration: BoxDecoration(
                                            // ignore: unrelated_type_equality_checks
                                            color: pageCntrl.selectedIndex == 0
                                                ? color.indicatorColor
                                                : color.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                ThemeConfig.radiusMid),
                                            border: Border.all(
                                                width: 1,
                                                color: color.indicatorColor))),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 10,
                                      // ignore: unrelated_type_equality_checks
                                      width: pageCntrl.selectedIndex == 1
                                          ? 15
                                          : 10,
                                      decoration: BoxDecoration(
                                          // ignore: unrelated_type_equality_checks
                                          color: pageCntrl.selectedIndex == 1
                                              ? color.indicatorColor
                                              : color.primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              ThemeConfig.radiusMid),
                                          border: Border.all(
                                              width: 1,
                                              color: color.indicatorColor)),
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 10,
                                      // ignore: unrelated_type_equality_checks
                                      width: pageCntrl.selectedIndex == 2
                                          ? 15
                                          : 10,
                                      decoration: BoxDecoration(
                                          // ignore: unrelated_type_equality_checks
                                          color: pageCntrl.selectedIndex == 2
                                              ? color.indicatorColor
                                              : color.primaryColor,
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
                                  Get.toNamed('/home');
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
                    )
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
