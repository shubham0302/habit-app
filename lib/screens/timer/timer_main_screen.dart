// ignore_for_file: unused_import, depend_on_referenced_packages, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/customize_screen/components/custom_dialog_box.dart';
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
    var _currentValue = 0.obs;
    ThemeController themeController = Get.find<ThemeController>();
    TimerTabController tabController =
        Get.put(TimerTabController(), permanent: false);

    ThemeData color = Theme.of(context);
    return Scaffold(
        // // floatingActionButton: FloatingActionButton(
        // //   onPressed: () {
        // //     CustomDialogBox(context);
        // //   },
        //   backgroundColor: color.primaryColor,
        //   child: const Icon(Icons.add),
        // ),
        backgroundColor: color.backgroundColor,
        body: SafeArea(
          child: GlobalPadding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

                    labelColor: Colors.white,
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

                  // Obx(
                  //   () => tabController.isFirst.value
                  //       ? SetTimerComponent(
                  //           changeAnimation: () {
                  //             animationController.duration =
                  //                 Duration(seconds: tabController.totalSeconds);
                  //             tabController.changeFirst();
                  //           },
                  //         )
                  //       : Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             // start timer screen
                  //             Container(
                  //               height: 350,
                  //               width: MediaQuery.of(context).size.width,
                  //               // color: color.cardColor,
                  //               child: Column(children: [
                  //                 Stack(
                  //                   alignment: Alignment.center,
                  //                   children: [
                  //                     SizedBox(
                  //                         width: 300,
                  //                         height: 300,
                  //                         child: CircularProgressIndicator(
                  //                           color: color.primaryColor,
                  //                           backgroundColor: color.disabledColor
                  //                               .withOpacity(0.6),
                  //                           value: progress,
                  //                           strokeWidth: 10,
                  //                         )),
                  //                     GestureDetector(
                  //                       onTap: () {
                  //                         if (animationController.isDismissed) {
                  //                           showModalBottomSheet(
                  //                               context: context,
                  //                               builder: (context) => Container(
                  //                                     height: 300,
                  //                                     child:
                  //                                         CupertinoTimerPicker(
                  //                                       initialTimerDuration:
                  //                                           animationController
                  //                                               .duration!,
                  //                                       backgroundColor: color
                  //                                           .backgroundColor,
                  //                                       onTimerDurationChanged:
                  //                                           (time) {
                  //                                         setState(() {
                  //                                           animationController
                  //                                                   .duration =
                  //                                               time;
                  //                                         });
                  //                                       },
                  //                                     ),
                  //                                   ));
                  //                         }
                  //                       },
                  //                       child: AnimatedBuilder(
                  //                         animation: animationController,
                  //                         builder: (context, child) => Text(
                  //                           countText,
                  //                           style: TextStyle(
                  //                               fontSize: 60,
                  //                               fontWeight: FontWeight.bold,
                  //                               color: color.primaryColor),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ]),
                  //             ),
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceEvenly,
                  //               children: [
                  //                 GestureDetector(
                  //                   onTap: () {
                  //                     print(tabController.totalSeconds);
                  //                     if (animationController.isAnimating) {
                  //                       animationController.stop();
                  //                       setState(() {
                  //                         isPlaying = false;
                  //                       });
                  //                     } else {
                  //                       animationController.reverse(
                  //                           from: animationController.value == 0
                  //                               ? 1.0
                  //                               : animationController.value);
                  //                       setState(() {
                  //                         isPlaying = true;
                  //                       });
                  //                     }
                  //                   },
                  //                   child: Container(
                  //                     height: 35,
                  //                     width: 90,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: const BorderRadius.all(
                  //                             Radius.circular(30)),
                  //                         color: color.primaryColor),
                  //                     child: Center(
                  //                         child: LabelText(
                  //                             text: isPlaying == true
                  //                                 ? "Pause"
                  //                                 : "Resume")),
                  //                   ),
                  //                 ),
                  //                 GestureDetector(
                  //                   onTap: () {
                  //                     animationController.reset();
                  //                     tabController.currentvalueHour.value = 0;
                  //                     tabController.currentvalueMin.value = 0;
                  //                     tabController.currentvalueSec.value = 0;
                  //                     setState(() {
                  //                       isPlaying = false;
                  //                     });
                  //                     tabController.changeFirst2();
                  //                   },
                  //                   child: Container(
                  //                     height: 35,
                  //                     width: 90,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: const BorderRadius.all(
                  //                             Radius.circular(30)),
                  //                         color: color.disabledColor
                  //                             .withOpacity(0.7)),
                  //                     child: const Center(
                  //                         child: MainLabelText(text: "delete")),
                  //                   ),
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  // ),

                  // index 2
                  IntervalTimeScreen()
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     SH.large(),
                  //     GlobalPadding(
                  //         child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: 45,
                  //               width: 45,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                   color: Colors.purpleAccent.shade100),
                  //               child: const Icon(
                  //                 Icons.brush,
                  //                 size: 35,
                  //               ),
                  //             ),
                  //             SW.large(),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 const MainLabelText(text: 'vjbsdjk'),
                  //                 Container(
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(3),
                  //                       color:
                  //                           color.primaryColor.withOpacity(.2)),
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 5, vertical: 2),
                  //                     child: LabelText(
                  //                       text: 'Habit',
                  //                       isColor: true,
                  //                       isBold: true,
                  //                       color: color.primaryColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //         SH.small(),
                  //         const Divider(
                  //           thickness: 1,
                  //         ),
                  //         SH.small(),
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: 45,
                  //               width: 45,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                   color: Colors.purpleAccent.shade100),
                  //               child: const Icon(
                  //                 Icons.brush,
                  //                 size: 35,
                  //               ),
                  //             ),
                  //             SW.large(),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 const MainLabelText(text: 'Cooking'),
                  //                 Container(
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(3),
                  //                       color:
                  //                           color.primaryColor.withOpacity(.2)),
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 5, vertical: 2),
                  //                     child: LabelText(
                  //                       text: 'Habit',
                  //                       isColor: true,
                  //                       isBold: true,
                  //                       color: color.primaryColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //         SH.small(),
                  //         const Divider(
                  //           thickness: 1,
                  //         ),
                  //         SH.small(),
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: 45,
                  //               width: 45,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                   color: Colors.purpleAccent.shade100),
                  //               child: const Icon(
                  //                 Icons.brush,
                  //                 size: 35,
                  //               ),
                  //             ),
                  //             SW.large(),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 const MainLabelText(text: 'Cooking'),
                  //                 Container(
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(3),
                  //                       color:
                  //                           color.primaryColor.withOpacity(.2)),
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 5, vertical: 2),
                  //                     child: LabelText(
                  //                       text: 'Habit',
                  //                       isColor: true,
                  //                       isBold: true,
                  //                       color: color.primaryColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //         SH.small(),
                  //         const Divider(
                  //           thickness: 1,
                  //         ),
                  //         SH.small(),
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: 45,
                  //               width: 45,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                   color: Colors.purpleAccent.shade100),
                  //               child: const Icon(
                  //                 Icons.brush,
                  //                 size: 35,
                  //               ),
                  //             ),
                  //             SW.large(),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 const MainLabelText(text: 'Cooking'),
                  //                 Container(
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(3),
                  //                       color:
                  //                           color.primaryColor.withOpacity(.2)),
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 5, vertical: 2),
                  //                     child: LabelText(
                  //                       text: 'Habit',
                  //                       isColor: true,
                  //                       isBold: true,
                  //                       color: color.primaryColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       ],
                  //     )),
                  //   ],
                  // ),
                ],
              ))
            ]),
          ),
        ));
  }
}

// @override
// Widget build(BuildContext context) {
//   ThemeData color = Theme.of(context);
//   return Column(children: [
//     SH.large(),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//               color: color.disabledColor.withOpacity(0.3)),
//           child: const LabelText(
//             text: "Stopwatch",
//             isColor: true,
//           ),
//         ),
//         const LabelText(text: "Timer"),
//         const LabelText(text: "Intervals")
//       ],
//     ),
//     SH.large(),
//     Column(
//       children: [
//         SH.medium(),
//         HeadingText(
//           text: "${digitHours}:${digitMinutes}:${digitSecound}",
//           isColor: T,
//         ),
//         SH.medium(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             HeadingText(text: "Laps           "),
//             HeadingText(text: "Time"),
//           ],
//         ),
//         SH.large(),
//         Container(
//           // color: Colors.green,
//           height: MediaQuery.of(context).size.height / 2.6,
//           width: MediaQuery.of(context).size.width,
//           child: ListView.builder(
//             itemCount: laps.length,
//             itemBuilder: (context, index) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   MainLabelText(text: "${index + 1}"),
//                   SW.medium(),
//                   MainLabelText(text: "${laps[index]}")
//                 ],
//               );
//             },
//           ),
//         ),
//         SH.large(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 !started ? start() : stop();
//               },
//               child: Container(
//                 height: 35,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: color.primaryColor),
//                 child: Center(
//                     child: HeadingText(
//                   text: !started ? "Start" : "Pause",
//                   isWhite: false,
//                   // isWhite: true,
//                 )),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 addLaps();
//               },
//               child: Icon(
//                 Icons.flag,
//                 size: 40,
//                 color: color.primaryColor,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 reset();
//                 laps.length = 0;
//               },
//               child: Container(
//                 height: 35,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: color.disabledColor.withOpacity(0.2)),
//                 child: Center(child: HeadingText(text: "Reset")),
//               ),
//             ),
//           ],
//         )
//       ],
//     )
//   ]);
// }
