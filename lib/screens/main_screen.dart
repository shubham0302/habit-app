// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/controllers/search_controller.dart';
import 'package:habbit_app/screens/categories/categories.dart';
import 'package:habbit_app/widgets/search_categories_customdailog.dart';
import 'package:habbit_app/screens/timer/timer_main_screen.dart';
import 'package:habbit_app/screens/habbit/habbits_screen.dart';
import 'package:habbit_app/screens/home_screen.dart';
import 'package:habbit_app/screens/task_screen/screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../widgets/bottomNavBar.dart';
import '../widgets/text_widget/label_text.dart';
import 'drawer.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  HomePageController controller =
      Get.put(HomePageController(), permanent: false);
  SearchController searchController =
      Get.put(SearchController(), permanent: false);
  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ThemeData color = Theme.of(context);
    openBottomSheet() {
      Get.bottomSheet(Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: color.backgroundColor,
        ),
        padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              TableCalendar(
                currentDay: DateTime.now(),

                calendarStyle: CalendarStyle(
                    weekendDecoration: BoxDecoration(
                        color: color.primaryColor.withOpacity(.1),
                        shape: BoxShape.circle),
                    defaultDecoration: BoxDecoration(
                        color: color.primaryColor.withOpacity(.1),
                        shape: BoxShape.circle),
                    todayDecoration: BoxDecoration(
                        color: color.primaryColor, shape: BoxShape.circle),
                    selectedDecoration:
                        BoxDecoration(color: color.primaryColor),
                    weekendTextStyle: TextStyle(color: color.primaryColor),
                    outsideTextStyle: TextStyle(
                      color: color.disabledColor,
                    )),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: color.primaryColor),
                  weekendStyle: TextStyle(color: color.primaryColor),
                ),
                // calendarStyle: CalendarStyle(),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    return;
                  },
                ),
                daysOfWeekHeight: 55,
                headerStyle: HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: color.primaryColor,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: color.primaryColor,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),

                headerVisible: true,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
              SH.large(),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        child: const LabelText(
                          text: 'CLOSE',
                          isBold: true,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        child: const LabelText(
                          text: 'TODAY',
                          isBold: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SH.large(),
              SH.large(),
            ],
          ),
        ),
      ));
    }

    return Scaffold(
      drawer: const Drawerr(),
      body: Obx(() => SafeArea(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  onEnd: () {
                    if (!searchController.childrenAnimation.value) {
                      log('na na ${searchController.childrenAnimation.value}');
                      // Timer(Duration(milliseconds: 300), () {
                      searchController.childrenAnimation.value =
                          !searchController.childrenAnimation.value;
                      // log(' na na ha ha ${searchController.childrenAnimation.value}');
                      // });
                    }
                  },

                  height: searchController.searchHome.value ? 100.0 : 0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: color.disabledColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  // duration: Duration(milliseconds: 300),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          height:
                              searchController.childrenAnimation.value ? 50 : 0,
                          width: 120,
                          // color: color.canvasColor,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1,
                                      color:
                                          color.disabledColor.withOpacity(0.2)),
                                  bottom: BorderSide(
                                      width: 1,
                                      color: color.disabledColor
                                          .withOpacity(0.2)))),
                          child: GlobalPadding(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DescriptionText(text: "ALL"),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: color.disabledColor,
                                  size: searchController.childrenAnimation.value
                                      ? 25
                                      : 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              SearchCategoryCustomDialogBox(context);
                            },
                            child: Container(
                              height: searchController.childrenAnimation.value
                                  ? 50
                                  : 0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: color.disabledColor
                                              .withOpacity(0.2)),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: color.disabledColor
                                              .withOpacity(0.2)))),
                              child: const Center(
                                  child: DescriptionText(
                                      text: "No categories selected")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: searchController.childrenAnimation.value
                                  ? 50
                                  : 0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: color.disabledColor
                                        ..withOpacity(0.2),
                                      size: searchController
                                              .childrenAnimation.value
                                          ? 25
                                          : 0,
                                    ),
                                    SW.medium(),
                                    Expanded(
                                      child: TextField(
                                        showCursor: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            // enabled: false,
                                            // border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(
                                                color: color.disabledColor),
                                            labelStyle: TextStyle(
                                                color: color.cardColor)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          height:
                              searchController.childrenAnimation.value ? 50 : 0,
                          width: 130,
                          // color: color.canvasColor,
                          decoration: BoxDecoration(
                              border: Border(
                            left: BorderSide(
                                width: 1,
                                color: color.disabledColor.withOpacity(0.2)),
                          )),
                          child: GlobalPadding(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.archive_outlined,
                                  color: color.disabledColor..withOpacity(0.2),
                                  size: searchController.childrenAnimation.value
                                      ? 25
                                      : 0,
                                ),
                                Icon(
                                  Icons.delete_outline,
                                  color: color.disabledColor..withOpacity(0.2),
                                  size: searchController.childrenAnimation.value
                                      ? 25
                                      : 0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // searchController.childrenAnimation.value =
                                    //     false;
                                    print(searchController
                                        .childrenAnimation.value);

                                    searchController.searchHome.value =
                                        !searchController.searchHome.value;

                                    if (searchController
                                        .childrenAnimation.value) {
                                      log('${searchController.childrenAnimation.value}');
                                      searchController.childrenAnimation.value =
                                          !searchController
                                              .childrenAnimation.value;
                                      log('${searchController.childrenAnimation.value}');
                                    }
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Icon(
                                    Icons.keyboard_arrow_up,
                                    color: color.disabledColor
                                      ..withOpacity(0.2),
                                    size:
                                        searchController.childrenAnimation.value
                                            ? 25
                                            : 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
                // : const SizedBox(),
                GlobalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Builder(
                            builder: (context) => GestureDetector(
                              onTap: () => Scaffold.of(context).openDrawer(),
                              // print('asd');

                              child: Icon(
                                Icons.format_list_bulleted_outlined,
                                color: color.primaryColor,
                                size: 30,
                              ),
                            ),
                          ),
                          SW.large(),
                          MainLabelText(
                              text: controller.tabIndex.value == 0
                                  ? 'Plannarize'
                                  : controller.tabIndex.value == 1
                                      ? "Task"
                                      : controller.tabIndex.value == 2
                                          ? "Categories"
                                          : controller.tabIndex.value == 3
                                              ? "Habbit"
                                              : controller.tabIndex.value == 4
                                                  ? "Timer"
                                                  : ""),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              searchController.searchHome.value =
                                  !searchController.searchHome.value;

                              if (searchController.childrenAnimation.value) {
                                searchController.childrenAnimation.value =
                                    !searchController.childrenAnimation.value;
                              }
                            },
                            child: Icon(
                              Icons.search,
                              color: color.disabledColor,
                              size: 30,
                            ),
                          ),
                          SW.medium(),
                          GestureDetector(
                            onTap: () {
                              controller.tabIndex.value == 0
                                  ? openBottomSheet()
                                  : null;
                            },
                            child: Icon(
                              controller.tabIndex.value == 0
                                  ? Icons.calendar_month
                                  : controller.tabIndex.value == 1
                                      ? Icons.move_to_inbox
                                      : controller.tabIndex.value == 2
                                          ? Icons.category
                                          : controller.tabIndex.value == 3
                                              ? Icons.move_to_inbox_sharp
                                              : controller.tabIndex.value == 4
                                                  ? Icons.notifications_active
                                                  : Icons.not_accessible,
                              color: color.disabledColor,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: controller.tabIndex.value,
                    children: [
                      HomePage(),
                      const TaskScreen(),
                      const CategoriesScreen(),
                      const HabbitsScreen(),
                      const TimerMainScreen(),
                    ],
                  ),
                ),
              ],
            ),
          )),
      bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),
    );
  }
}
