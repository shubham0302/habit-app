// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, avoid_print

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/interval_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/timer/save_dailog.dart';
import 'package:habbit_app/screens/timer/set_timer_component.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:vibration/vibration.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({super.key});

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> with TickerProviderStateMixin {
  late AnimationController animationController;
  TimerTabController tabController =
      Get.put(TimerTabController(), permanent: false);

  late TabController _controller;

  bool isPlaying = false;

  // int get countText2 {
  //   int count = tabController.totalSeconds;
  //   return;
  // }

  String get countText {
    Duration count = animationController.duration! * animationController.value;
    return animationController.isDismissed
        ? '${animationController.duration!.inHours}:${(animationController.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(animationController.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    if (mounted) {
      animationController.dispose();
    }
    super.dispose();
  }

  double progress = 1.0;

  void notifiy() {
    if (countText == "0:00:01") {
      // SaveTimeCustomDialogBox(context);
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    TimerTabController tabController =
        Get.put(TimerTabController(), permanent: false);
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      tabController.tabIndex.value = _controller.index;
      // print(tabController.tabIndex.value);
    });
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: tabController.totalSeconds));
    animationController.addListener(() {
      notifiy();
      if (animationController.isAnimating) {
        setState(() {
          progress = animationController.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    IntervalTabController intervalTabController =
        Get.put(IntervalTabController(), permanent: false);
    var color = Theme.of(context);
    return Obx(
      () => tabController.isFirst.value
          ? SetTimerComponent(
              changeAnimation: () {
                animationController.duration =
                    Duration(seconds: tabController.totalSeconds);
                tabController.changeFirst();
              },
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // start timer screen
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  // color: color.cardColor,
                  child: Column(children: [
                    Container(
                      height: 250,
                      width: 250,
                      child: CircularCountDownTimer(
                        // initialDuration: 2,
                        strokeWidth: 10,
                        controller: tabController.controller,
                        isReverse: true,
                        // autoStart: false,
                        textStyle: TextStyle(
                            fontSize: 20.0,
                            color: color.canvasColor,
                            fontWeight: FontWeight.bold),
                        // textFormat: ,

                        textFormat: tabController.totalSeconds >= 3600
                            ? CountdownTextFormat.HH_MM_SS
                            : tabController.totalSeconds >= 60
                                ? CountdownTextFormat.MM_SS
                                : CountdownTextFormat.SS,
                        duration: tabController.totalSeconds,
                        height: 100,
                        width: 100,
                        onComplete: () async {
                          tabController.changeFirst2();

                          if (intervalTabController.isVibration.value) {
                            if (await Vibration.hasVibrator() == true) {
                              Vibration.vibrate();
                            }
                          }
                          print(intervalTabController.isSound.value);
                          if (intervalTabController.isSound.value) {
                            FlutterRingtonePlayer.playNotification();
                          }

                          SaveTimeCustomDialogBox(context);
                          // intervalTabController.startInterval();
                          print('object');
                        },
                        fillColor: color.disabledColor,
                        ringColor: color.primaryColor,
                      ),
                    ),
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     SizedBox(
                    //         width: 300,
                    //         height: 300,
                    //         child: CircularProgressIndicator(
                    //           color: color.primaryColor,
                    //           backgroundColor:
                    //               color.disabledColor.withOpacity(0.6),
                    //           value: progress,
                    //           strokeWidth: 10,
                    //         )),
                    //     GestureDetector(
                    //       onTap: () {
                    //         if (animationController.isDismissed) {
                    //           showModalBottomSheet(
                    //               context: context,
                    //               builder: (context) => Container(
                    //                     height: 300,
                    //                     child: CupertinoTimerPicker(
                    //                       initialTimerDuration:
                    //                           animationController.duration!,
                    //                       backgroundColor:
                    //                           color.backgroundColor,
                    //                       onTimerDurationChanged: (time) {
                    //                         setState(() {
                    //                           animationController.duration =
                    //                               time;
                    //                         });
                    //                       },
                    //                     ),
                    //                   ));
                    //         }
                    //       },
                    //       child: AnimatedBuilder(
                    //         animation: animationController,
                    //         builder: (context, child) => Text(
                    //           countText,
                    //           style: TextStyle(
                    //               fontSize: 60,
                    //               fontWeight: FontWeight.bold,
                    //               color: color.primaryColor),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        tabController.paused.value == true
                            ? tabController.resumed()
                            : tabController.pause();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.primaryColor),
                        child: Center(
                            child: Obx(
                          () => LabelText(
                            text: tabController.paused.value == true
                                ? 'Resume'
                                : "Pause".tr,
                            isBold: true,
                            isColor: true,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        animationController.reset();
                        tabController.currentvalueHour.value =
                            tabController.stopWatchHour.value;
                        tabController.currentvalueMin.value =
                            tabController.stopWatchMin.value;
                        tabController.currentvalueSec.value =
                            tabController.stopWatchSec.value;
                        tabController.currentvalueHour.value = 0;
                        tabController.currentvalueMin.value = 0;
                        tabController.currentvalueSec.value = 0;
                        // tabController.controller.reset();
                        tabController.changeFirst2();
                        SaveTimeCustomDialogBox(context);
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.primaryColor),
                        child: const Center(
                            child: LabelText(
                          text: "Stop",
                          isColor: true,
                          color: Colors.white,
                          isBold: true,
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
