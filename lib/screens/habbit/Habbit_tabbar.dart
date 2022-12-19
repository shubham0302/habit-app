// ignore_for_file: unused_import, depend_on_referenced_packages, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_print

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/customize_screen/components/custom_dialog_box.dart';
import 'package:habbit_app/screens/customize_screen/timer/set_timer_component.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class HabbitTabbar extends StatefulWidget {
  const HabbitTabbar({super.key});

  @override
  State<HabbitTabbar> createState() => _HabbitTabbarState();
}

class _HabbitTabbarState extends State<HabbitTabbar>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  TimerTabController tabController =
      Get.put(TimerTabController(), permanent: false);

  late TabController _controller;

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
    animationController.addListener(() {});
  }

  // final HomePageController controller =
  //     Get.put(HomePageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    List months = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];
    var now = new DateTime.now();
    var current_mon = now.month;
    var _currentValue = 0.obs;
    ThemeController themeController = Get.find<ThemeController>();
    TimerTabController tabController =
        Get.put(TimerTabController(), permanent: false);

    ThemeData color = Theme.of(context);
    return Scaffold(
        body: GlobalPadding(
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

              labelColor: Colors.white,
              unselectedLabelColor: color.disabledColor,
              // indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Column(
                  children: [
                    const Tab(
                      text: 'Calender',
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
                      text: 'Statistics',
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
                      text: 'Edits',
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (() {
                          Get.back();
                        }),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: color.primaryColor,
                            ),
                            SW.small(),
                            DescriptionText(
                                text: months[
                                        current_mon == 1 ? 11 : current_mon - 2]
                                    .toString()
                                    .toUpperCase())
                          ],
                        )),
                    Column(
                      children: [
                        LabelText(
                          text:
                              months[current_mon - 1].toString().toUpperCase(),
                          isBold: true,
                        ),
                        SH.small(),
                        DescriptionText(text: DateTime.now().year.toString())
                      ],
                    ),
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (() {
                          Get.back();
                        }),
                        child: Row(
                          children: [
                            DescriptionText(
                                text: months[
                                        current_mon == 12 ? 0 : current_mon + 1]
                                    .toString()
                                    .toUpperCase()),
                            SW.small(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: color.primaryColor,
                            ),
                          ],
                        ))
                  ],
                ),
                SH.small(),
                TableCalendar(
                  calendarStyle: CalendarStyle(
                      weekendTextStyle: TextStyle(color: color.cardColor),
                      outsideTextStyle: TextStyle(
                        color: color.disabledColor,
                      )),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: color.cardColor),
                    weekendStyle: TextStyle(color: color.cardColor),
                  ),
// calendarStyle: CalendarStyle(),
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      return;
                    },
                  ),
                  daysOfWeekHeight: 55,
                  headerVisible: false,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
                Divider(
                  thickness: 1,
                ),
                SH.large(),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: color.disabledColor.withOpacity(.3)),
                    child: DescriptionText(
                      text: 'Notes',
                    ),
                  ),
                ),
                SH.medium(),
                LabelText(
                    text:
                        'This is to notif thhat tasks are important for you asjdnn dksfn'),
                Divider(),
                LabelText(
                    text:
                        'This is to notif thhat tasks are important for you asjdnn dksfn')
              ],
            ),
            GlobalPadding(
                child: Column(
              children: [],
            )),
            GlobalPadding(
                child: Column(
              children: [],
            )),
          ],
        ))
      ]),
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
