// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';

import '../../controllers/timer_tab_controller.dart';
import '../../widgets/text_widget/main_label_text.dart';

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
    // TODO: implement initState
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
                    width: 280,
                    height: 280,
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
                    width: 280,
                    height: 280,
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: const [
        //     LabelText(
        //       text: "LAPS",
        //       isBold: true,
        //     ),
        //     LabelText(
        //       text: "TIME",
        //       isBold: true,
        //     ),
        //   ],
        // ),
        SH.large(),
        // Container(
        //   // color: Colors.green,
        //   height: MediaQuery.of(context).size.height / 3.6,
        //   width: MediaQuery.of(context).size.width,
        //   child: ListView.separated(
        //     separatorBuilder: (context, index) => Divider(),
        //     itemCount: laps.length,
        //     itemBuilder: (context, index) {
        //       return Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           MainLabelText(text: "${index + 1}"),
        //           SW.medium(),
        //           MainLabelText(text: "${laps[index]}")
        //         ],
        //       );
        //     },
        //   ),
        // ),
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
                        text: !started ? "START" : "PAUSE",
                        isBold: true,
                        isWhite: false,
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
                    text: !started ? "START" : "PAUSE",
                    isBold: true,
                    isWhite: false,
                    // isWhite: true,
                  )),
                ),
              ),
      ])
    ]);
  }
}
