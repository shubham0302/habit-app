// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/timer/set_timer_component.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

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
    animationController.dispose();
    super.dispose();
  }

  double progress = 1.0;

  void notifiy() {
    if (countText == "0:00:00") {
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // start timer screen
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  // color: color.cardColor,
                  child: Column(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 300,
                            height: 300,
                            child: CircularProgressIndicator(
                              color: color.primaryColor,
                              backgroundColor:
                                  color.disabledColor.withOpacity(0.6),
                              value: progress,
                              strokeWidth: 10,
                            )),
                        GestureDetector(
                          onTap: () {
                            if (animationController.isDismissed) {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        height: 300,
                                        child: CupertinoTimerPicker(
                                          initialTimerDuration:
                                              animationController.duration!,
                                          backgroundColor:
                                              color.backgroundColor,
                                          onTimerDurationChanged: (time) {
                                            setState(() {
                                              animationController.duration =
                                                  time;
                                            });
                                          },
                                        ),
                                      ));
                            }
                          },
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) => Text(
                              countText,
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: color.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(tabController.totalSeconds);
                        if (animationController.isAnimating) {
                          animationController.stop();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          animationController.reverse(
                              from: animationController.value == 0
                                  ? 1.0
                                  : animationController.value);
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                      child: Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: color.primaryColor),
                        child: Center(
                            child: LabelText(
                                text: isPlaying == true ? "Pause" : "Resume")),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        animationController.reset();
                        tabController.currentvalueHour.value = 0;
                        tabController.currentvalueMin.value = 0;
                        tabController.currentvalueSec.value = 0;
                        setState(() {
                          isPlaying = false;
                        });
                        tabController.changeFirst2();
                      },
                      child: Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: color.disabledColor.withOpacity(0.7)),
                        child:
                            const Center(child: MainLabelText(text: "delete")),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
