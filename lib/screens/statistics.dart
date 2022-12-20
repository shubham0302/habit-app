// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = 1.0;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          SH.large(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: color.disabledColor.withOpacity(0.3)),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: DescriptionText(text: "Habit score"),
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
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      color: color.primaryColor,
                      backgroundColor: color.disabledColor.withOpacity(0.6),
                      value: progress,
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
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: DescriptionText(text: "Steak"),
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
                        text: "Current",
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
                    child: const Center(
                      child: MainLabelText(
                        text: "3 DAYS",
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
                        text: "Best",
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
                    child: const Center(
                      child: MainLabelText(
                        text: "12 DAYS",
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
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: DescriptionText(text: "Times completed"),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
