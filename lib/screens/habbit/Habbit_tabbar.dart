// ignore_for_file: unused_import, depend_on_referenced_packages, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_print, file_names, unnecessary_new, non_constant_identifier_names

import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/habbit/bargraph.dart';
import 'package:habbit_app/screens/habbit/bargraph2.dart';
import 'package:habbit_app/screens/habbit/statistics.dart';
import 'package:habbit_app/widgets/theme_config.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/widgets/custom_dialog_box.dart';
import 'package:habbit_app/screens/timer/set_timer_component.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../widgets/text_widget/title_text.dart';

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
    _controller = TabController(
        length: 3, vsync: this, initialIndex: tabController.tabIndex.value);
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      // titleTextFormatter: (date, locale) => Column(children: [],),
                    ),

                    headerVisible: true,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.large(),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: color.disabledColor.withOpacity(.3)),
                      child: const DescriptionText(
                        text: 'Notes',
                      ),
                    ),
                  ),
                  SH.medium(),
                  const LabelText(
                      text:
                          'This is to notif thhat tasks are important for you asjdnn dksfn'),
                  const Divider(),
                  const LabelText(
                      text:
                          'This is to notif thhat tasks are important for you asjdnn dksfn')
                ],
              ),
            ),
            // index2
            const Statistics(),
            GlobalPadding(
                child: Column(
              children: const [],
            )),
          ],
        ))
      ]),
    ));
  }
}
