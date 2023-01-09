// ignore_for_file: unused_import, depend_on_referenced_packages, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habbit_app/controllers/interval_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/timer/interval_timer_start_screen.dart';
import 'package:habbit_app/widgets/custom_dialog_box.dart';
// import 'package:habbit_app/screens/customize_screen/components/custom_dialog_box.dart';
import 'package:habbit_app/screens/timer/interval_time_screen.dart';
import 'package:habbit_app/screens/timer/set_timer_component.dart';
import 'package:habbit_app/screens/timer/stopwatch.dart';
import 'package:habbit_app/screens/timer/timer_screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class TimerMainScreen extends StatefulWidget {
  const TimerMainScreen({super.key});

  @override
  State<TimerMainScreen> createState() => _TimerMainScreenState();
}

// class _TimerMainScreenState extends State<TimerMainScreen> {
// int second = 0, minutes = 0, hours = 0;
// String digitSecound = "00", digitMinutes = "00", digitHours = "00";
// Timer? timer;
// bool started = false;
// List laps = [];

// void stop() {
//   timer!.cancel();
//   setState(() {
//     started = false;
//   });
// }

// void reset() {
//   timer!.cancel();
//   setState(() {
//     second = 0;
//     minutes = 0;
//     hours = 0;

//     digitSecound = "00";
//     digitMinutes = "00";
//     digitHours = "00";

//     started = false;
//   });
// }

// void addLaps() {
//   String lap = "$digitHours:$digitMinutes:$digitSecound";
//   setState(() {
//     laps.add(lap);
//   });
// }

// void start() {
//   started = true;
//   timer = Timer.periodic(Duration(seconds: 1), (timer) {
//     int localSecound = second + 1;
//     int localMinute = minutes;
//     int localHour = hours;

//     if (localSecound > 59) {
//       if (localMinute > 59) {
//         localHour++;
//         localMinute = 0;
//       } else {
//         localMinute++;
//         localSecound = 0;
//       }
//     }
//     setState(() {
//       second = localSecound;
//       minutes = localMinute;
//       hours = localHour;
//       digitSecound = (second >= 10) ? "$second" : "0$second";
//       digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
//       digitHours = (hours >= 10) ? "$hours" : "0$hours";
//     });
//   });
// }
// }

class _TimerMainScreenState extends State<TimerMainScreen>
    with TickerProviderStateMixin {
  // late AnimationController animationController;
  TimerTabController tabController =
      Get.put(TimerTabController(), permanent: false);

  late TabController _controller;

  // bool isPlaying = false;

  // int get countText2 {
  //   int count = tabController.totalSeconds;
  //   return;
  // }

  // String get countText {
  //   Duration count = animationController.duration! * animationController.value;
  //   return animationController.isDismissed
  //       ? '${animationController.duration!.inHours}:${(animationController.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(animationController.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
  //       : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  // }

  // @override
  // void dispose() {
  //   animationController.dispose();
  //   super.dispose();
  // }

  // double progress = 1.0;

  // void notifiy() {
  //   if (countText == "0:00:00") {
  //     FlutterRingtonePlayer.playNotification();
  //   }
  // }

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
    // animationController = AnimationController(
    //     vsync: this, duration: Duration(seconds: tabController.totalSeconds));
    // animationController.addListener(() {
    //   // notifiy();
    //   // if (animationController.isAnimating) {
    //   //   setState(() {
    //   //     progress = animationController.value;
    //   //   });
    //   // } else {
    //   //   setState(() {
    //   //     progress = 1.0;
    //   //     isPlaying = false;
    //   //   });
    //   // }
    // });
  }

  // final HomePageController controller =
  //     Get.put(HomePageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    IntervalTabController intervalTabController =
        Get.put(IntervalTabController(), permanent: false);
    var _currentValue = 0.obs;
    ThemeController themeController = Get.find<ThemeController>();
    TimerTabController tabController =
        Get.put(TimerTabController(), permanent: false);

    ThemeData color = Theme.of(context);
    return
        // Scaffold(
        //     // // floatingActionButton: FloatingActionButton(
        //     // //   onPressed: () {
        //     // //     CustomDialogBox(context);
        //     // //   },
        //     //   backgroundColor: color.primaryColor,
        //     //   child: const Icon(Icons.add),
        //     // ),
        //     backgroundColor: color.backgroundColor,
        //     body:
        SafeArea(
      child: GlobalPadding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // SH.med(),
          Obx(() {
            // tabController.tabIndex.value = _controller.index;
            return Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                onTap: (index) {},
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                controller: _controller,
                splashFactory: NoSplash.splashFactory,
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.transparent,
                ),

                labelColor: color.cardColor,
                unselectedLabelColor: color.disabledColor,
                // indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Column(
                    children: [
                      const Tab(
                        text: 'Stopwatch',
                      ),
                      Container(
                        height: 2,
                        // width: ,
                        color: tabController.tabIndex.value == 0
                            ? color.primaryColor
                            : Colors.transparent,
                      )
                    ],
                  ),
                  // SizedBox(width: 5,),
                  Column(
                    children: [
                      const Tab(
                        text: 'Timer',
                      ),
                      Container(
                        height: 2,
                        // width: ,
                        color: tabController.tabIndex.value == 1
                            ? color.primaryColor
                            : Colors.transparent,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Tab(
                        text: 'Intervals',
                      ),
                      Container(
                        height: 2,
                        // width: ,
                        color: tabController.tabIndex.value == 2
                            ? color.primaryColor
                            : Colors.transparent,
                      )
                    ],
                  ),
                ],
              ),
            );
          }),

          SH.large(),
          Expanded(
              child: TabBarView(
            controller: _controller,
            children: const [
              StopWatch(),
              // index 1
              TimerTab(),

              // index 2
              IntervalTimeScreen()
              // : const IntervalTimerStartScreen(),
            ],
          ))
        ]),
      ),
    );
    // );
  }
}
