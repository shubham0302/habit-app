// ignore_for_file: sized_box_for_whitespace, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';

import '../../controllers/timer_tab_controller.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool started = false;
  RxBool startStopwatch = false.obs;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.forward(from: 0);
    });

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  List laps = [];
  int second = 0, minutes = 0, hours = 0;
  String digitSecound = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      second = 0;
      minutes = 0;
      hours = 0;

      digitSecound = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSecound";
    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSecound = second + 1;
      int localMinute = minutes;
      int localHour = hours;

      if (localSecound > 59) {
        if (localMinute > 59) {
          localHour++;
          localMinute = 0;
        } else {
          localMinute++;
          localSecound = 0;
        }
      }
      setState(() {
        second = localSecound;
        minutes = localMinute;
        hours = localHour;
        digitSecound = (second >= 10) ? "$second" : "0$second";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TimerTabController timerTabController =
        Get.put(TimerTabController(), permanent: false);
    var color = Theme.of(context);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [
        // SH.medium(),
        timerTabController.animation.value == true
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                      // startAngle: 1,
                      colors: [
                        color.primaryColor.withOpacity(0.5),
                        color.primaryColor
                      ],
                      transform:
                          GradientRotation(_animationController.value * 6)),
                  // borderRadius: BorderRadius.circular(50),
                  // border: Border.all(color: color.canvasColor)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.height * .35,
                    height: MediaQuery.of(context).size.height * .35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.backgroundColor,
                      // borderRadius: BorderRadius.circular(50),
                      // border: Border.all(width: 2, color: color.primaryColor)
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Center(
                      child: TitleText(
                        // ignore: unnecessary_brace_in_string_interps
                        text: "${digitHours}:${digitMinutes}:${digitSecound}",
                        isColor: true,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color.primaryColor
                    // gradient: SweepGradient(
                    //     // startAngle: 1,
                    //     colors: [
                    //       color.primaryColor.withOpacity(0.5),
                    //       color.primaryColor
                    //     ],
                    //     transform: GradientRotation(_animationController.value * 6)),
                    // borderRadius: BorderRadius.circular(50),
                    // border: Border.all(color: color.canvasColor)
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.height * .35,
                    height: MediaQuery.of(context).size.height * .35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.backgroundColor,
                      // borderRadius: BorderRadius.circular(50),
                      // border: Border.all(width: 2, color: color.primaryColor)
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Center(
                      child: TitleText(
                        // ignore: unnecessary_brace_in_string_interps
                        text: "${digitHours}:${digitMinutes}:${digitSecound}",
                        isColor: true,
                      ),
                    ),
                  ),
                ),
              ),
        SH.large(),

        // SH.large(),

        SH.large(),
        startStopwatch.value == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      !started ? start() : stop();
                      // startStopwatch.value = false;
                      timerTabController.animation.value == true
                          ? timerTabController.animation.value = false
                          : timerTabController.animation.value = true;
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: color.primaryColor),
                      child: Center(
                          child: LabelText(
                        text: !started ? "Start".tr : "Pause".tr,
                        isBold: true,
                        // isWhite: false,s
                        isColor: true,
                        color: Colors.white,
                        // isWhite: true,
                      )),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     addLaps();
                  //   },
                  //   child: Icon(
                  //     Icons.flag,
                  //     size: 40,
                  //     color: color.primaryColor,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      reset();
                      laps.length = 0;
                      timerTabController.animation.value = false;
                      startStopwatch.value = false;
                    },
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: color.disabledColor.withOpacity(0.2)),
                      child: const Center(
                          child: LabelText(
                        text: "RESET",
                        isColor: true,
                        color: Colors.white,
                        isBold: true,
                      )),
                    ),
                  ),
                ],
              )
            : GestureDetector(
                onTap: () {
                  !started ? start() : stop();
                  timerTabController.animation.value == true
                      ? timerTabController.animation.value = false
                      : timerTabController.animation.value = true;
                  startStopwatch.value = true;
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: color.primaryColor),
                  child: Center(
                      child: LabelText(
                    text: !started ? "Start".tr : "Pause".tr,
                    isBold: true,
                    // isWhite: false,
                    isColor: true,
                    color: Colors.white,
                    // isWhite: true,
                  )),
                ),
              ),
      ])
    ]);
  }
}
