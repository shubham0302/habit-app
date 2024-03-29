// ignore_for_file: depend_on_referenced_packages, unnecessary_import, implementation_imports, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/habbit/bargraph.dart';
import 'package:habbit_app/screens/habbit/bargraph2.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';

import 'package:habbit_app/widgets/theme_config.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        SH.large(),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: color.disabledColor.withOpacity(0.3)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DescriptionText(text: "Habit score".tr),
            ),
          ),
        ),
        SH.large(),
        SH.large(),
        Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    color: color.primaryColor,
                    backgroundColor: color.disabledColor.withOpacity(0.6),
                    value: .1,
                    strokeWidth: 10,
                  )),
              Text(
                "58",
                style: TextStyle(color: color.cardColor, fontSize: 40),
              )
              // GestureDetector(
              //   onTap: () {
              //     if (animationController.isDismissed) {
              //       showModalBottomSheet(
              //           context: context,
              //           builder: (context) => Container(
              //                 height: 300,
              //                 child: CupertinoTimerPicker(
              //                   initialTimerDuration:
              //                       animationController.duration!,
              //                   backgroundColor: color.backgroundColor,
              //                   onTimerDurationChanged: (time) {
              //                     setState(() {
              //                       animationController.duration = time;
              //                     });
              //                   },
              //                 ),
              //               ));
              //     }
              //   },
              //   child: AnimatedBuilder(
              //     animation: animationController,
              //     builder: (context, child) => Text(
              //       countText,
              //       style: TextStyle(
              //           fontSize: 60,
              //           fontWeight: FontWeight.bold,
              //           color: color.primaryColor),
              //     ),
              //   ),
              // ),
            ],
          ),
        ]),
        SH.large(),
        const Divider(
          thickness: 2,
        ),
        SH.large(),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: color.disabledColor.withOpacity(0.3)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DescriptionText(text: "Steak".tr),
            ),
          ),
        ),
        SH.large(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: color.primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                    child: LabelText(
                      text: "Current".tr,
                      isColor: true,
                      color: color.backgroundColor,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: color.disabledColor.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                    child: MainLabelText(
                      text: "3 DAYS".tr,
                      isColor: true,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: color.primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                    child: LabelText(
                      text: "Best".tr,
                      isColor: true,
                      color: color.backgroundColor,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: color.disabledColor.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                    child: MainLabelText(
                      text: "12 DAYS".tr,
                      isColor: true,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        SH.large(),
        const Divider(
          thickness: 2,
        ),
        SH.large(),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: color.disabledColor.withOpacity(0.3)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DescriptionText(text: "Times completed".tr),
            ),
          ),
        ),
        const BarGraph(),
        SH.large(),
        const Divider(
          thickness: 2,
        ),
        SH.large(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (() {
                  // Get.back();
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: color.primaryColor,
                    ),
                    // SW.small(),
                    // DescriptionText(
                    //     text: months[
                    //             current_mon == 1 ? 11 : current_mon - 2]
                    //         .toString()
                    //         .toUpperCase())
                  ],
                )),
            Column(
              children: [
                LabelText(
                  text: DateTime.now().year.toString(),
                  isBold: true,
                ),
                SH.small(),
                DescriptionText(text: "Times completed".tr)
              ],
            ),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (() {
                  // Get.back();
                }),
                child: Row(
                  children: [
                    // DescriptionText(
                    //     text: months[
                    //             current_mon == 12 ? 0 : current_mon + 1]
                    //         .toString()
                    //         .toUpperCase()),
                    // SW.small(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: color.primaryColor,
                    ),
                  ],
                ))
          ],
        ),
        SH.large(),
        const BarGraph2(),
        SH.large(),
        const Divider(
          thickness: 2,
        ),
        SH.large(),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: color.disabledColor.withOpacity(0.3)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DescriptionText(text: "Success/Fail".tr),
            ),
          ),
        ),
        SH.large(),
        Container(
          height: 300,
          width: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(PieChartData(
                  startDegreeOffset: 270,
                  sectionsSpace: 0,
                  centerSpaceRadius: 80,
                  sections: showingSections(context))),
              Positioned(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DescriptionText(text: 'Total Days'.tr),
                  const TitleText(
                    text: '32',
                  ),
                ],
              ))
            ],
          ),
        ),
        SH.large(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: const Color(0xFF22CF4B),
                ),
                SW.small(),
                DescriptionText(text: 'Success -'.tr),
                SW.small(),
                DescriptionText(
                  text: "24",
                  isBold: true,
                  isColor: true,
                  color: color.cardColor,
                  isWhite: true,
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: const Color(0xFFFFD816),
                ),
                SW.small(),
                DescriptionText(text: 'Skip -'.tr),
                SW.small(),
                DescriptionText(
                  text: "6",
                  isBold: true,
                  isColor: true,
                  color: color.cardColor,
                  isWhite: true,
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: const Color(0xFFDD2D2D),
                ),
                SW.small(),
                DescriptionText(text: 'Fail -'.tr),
                SW.small(),
                DescriptionText(
                  text: "2",
                  isBold: true,
                  isColor: true,
                  color: color.cardColor,
                  isWhite: true,
                )
              ],
            ),
          ],
        ),
        SH.large(),
        const Divider(
          thickness: 2,
        ),
        SH.large(),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: color.disabledColor.withOpacity(0.3)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DescriptionText(text: "Streak challenge".tr),
            ),
          ),
        ),
        SH.large(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SH.medium(),
                LabelText(
                  text: "  1\nday",
                  isColor: true,
                  color: color.canvasColor,
                )
              ],
            ),
            // SW.medium(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SH.medium(),
                LabelText(
                  text: "  7\nday",
                  isColor: true,
                  color: color.canvasColor,
                )
              ],
            ),
            // SW.medium(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge3d.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SH.medium(),
                LabelText(
                  text: " 15\nday",
                  isColor: true,
                  color: color.canvasColor,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge3d.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SH.medium(),
                LabelText(
                  text: " 30\nday",
                  isColor: true,
                  color: color.canvasColor,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge3d.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SH.medium(),
                LabelText(
                  text: " 60\nday",
                  isColor: true,
                  color: color.canvasColor,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge3d.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SH.medium(),
                LabelText(
                  text: "100\nday",
                  isColor: true,
                  color: color.canvasColor,
                )
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/badge3d.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                  SH.medium(),
                  LabelText(
                    text: "200\nday".tr,
                    isColor: true,
                    color: color.canvasColor,
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}

List<PieChartSectionData> showingSections(BuildContext context) {
  return List.generate(4, (index) {
    // final isTouched = index == touchedIndex;
    // final double opacity = isTouched ? 1 : 0.6;

    // Condition
    switch (index) {
      case 0:
        return PieChartSectionData(
          color: const Color(0xFF22CF4B),

          value: 6,
          // title: ctrl.taskCount.value.data!.pending!.toString(),
          radius: 20,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF22CF4B),
          ),
          titlePositionPercentageOffset: 0.5,
        );
      case 1:
        return PieChartSectionData(
          color: const Color(0xFFDD2D2D),
          value: 1,
          // title: ctrl.taskCount.value.data!.verify!.toString(),
          radius: 20,
          titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDD2D2D)),
          titlePositionPercentageOffset: 0.5,
        );
      case 2:
        return PieChartSectionData(
          color: const Color(0xFFFFD816),
          value: 3,
          // title: ctrl.taskCount.value.data!.inProgress!.toString(),
          radius: 20,
          titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFD816)),
          titlePositionPercentageOffset: 0.5,
        );
      // case 3:
      //   return PieChartSectionData(
      //     color: ThemeConfig.mainTextColor,
      //     // value: 4,
      //     // title: ctrl.taskCount.value.data!.completed!.toString(),
      //     radius: 20,
      //     titleStyle: const TextStyle(
      //         fontSize: 12,
      //         fontWeight: FontWeight.bold,
      //         color: ThemeConfig.whiteColor),
      //     titlePositionPercentageOffset: 0.5,
      //   );

      default:
        return PieChartSectionData(
          color: ThemeConfig.redColor,
          value: 0,
          title: "yellow pie",
          radius: 20,
          titleStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          titlePositionPercentageOffset: 0.5,
        );
    }
  });
}
