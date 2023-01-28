// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/controllers/search_controller.dart';
import 'package:habbit_app/screens/categories/categories.dart';
import 'package:habbit_app/screens/habit_archive.dart';
import 'package:habbit_app/widgets/search_categories_customdailog.dart';
import 'package:habbit_app/screens/timer/timer_main_screen.dart';
import 'package:habbit_app/screens/habbit/habbits_screen.dart';
import 'package:habbit_app/screens/home_screen.dart';
import 'package:habbit_app/screens/task_screen/screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/search_widget.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../widgets/bottomNavBar.dart';
import '../widgets/text_widget/label_text.dart';
import 'drawer.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              TableCalendar(
                currentDay: controller.selectedDay,
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay = selectedDay;
                  // controller.selectedDay.obs;
                },

                // selectedDayPredicate: (day) => true,

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
                        child: LabelText(
                          text: 'CLOSE'.tr,
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
                        child: LabelText(
                          text: 'TODAY'.tr,
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
                          padding: const EdgeInsets.all(7),
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
                          child: SesrchAllDropDown(),
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
                              child: Center(
                                  child: DescriptionText(
                                      text: "No categories selected".tr)),
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
                                        // onChanged: searchController
                                        //     .searchLetter(query, index),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            // enabled: false,
                                            // border: OutlineInputBorder(),
                                            hintText: 'Enter a search term'.tr,
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
                          SizedBox(
                            width: 150,
                            height: 23,
                            child: ListView(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height: 0,
                                  child: MainLabelText(
                                    text: 'plannarize'.tr,
                                    isColor: true,
                                    color: controller.tabIndex.value == 0
                                        ? color.cardColor
                                        : color.backgroundColor,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height:
                                      controller.tabIndex.value == 0 ? 20 : 0,
                                  child: MainLabelText(
                                    text: 'plannarize'.tr,
                                    isColor: true,
                                    color: controller.tabIndex.value == 0
                                        ? color.cardColor
                                        : color.backgroundColor,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height:
                                      controller.tabIndex.value == 1 ? 20 : 0,
                                  child: MainLabelText(
                                      text: 'Tasks'.tr,
                                      isColor: true,
                                      color: controller.tabIndex.value == 1
                                          ? color.cardColor
                                          : color.backgroundColor),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height:
                                      controller.tabIndex.value == 2 ? 20 : 0,
                                  child: MainLabelText(
                                      text: 'Categories'.tr,
                                      isColor: true,
                                      color: controller.tabIndex.value == 2
                                          ? color.cardColor
                                          : color.backgroundColor),
                                ),
                                habbitSelectController.habitArcive.value ==
                                        false
                                    ? AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        height: controller.tabIndex.value == 3
                                            ? 20
                                            : 0,
                                        child: MainLabelText(
                                            text: 'Habit'.tr,
                                            isColor: true,
                                            color:
                                                controller.tabIndex.value == 3
                                                    ? color.cardColor
                                                    : color.backgroundColor),
                                      )
                                    : AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        height: controller.tabIndex.value == 3
                                            ? 20
                                            : 0,
                                        child: MainLabelText(
                                            text: 'Arcive'.tr,
                                            isColor: true,
                                            color:
                                                controller.tabIndex.value == 3
                                                    ? color.cardColor
                                                    : color.backgroundColor),
                                      ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height:
                                      controller.tabIndex.value == 4 ? 20 : 0,
                                  child: MainLabelText(
                                      text: 'Timer'.tr,
                                      isColor: true,
                                      color: controller.tabIndex.value == 4
                                          ? color.cardColor
                                          : color.backgroundColor),
                                ),
                              ],
                            ),
                          )
                          // MainLabelText(
                          //     text: controller.tabIndex.value == 0
                          //         ? 'Plannarize'
                          //         : controller.tabIndex.value == 1
                          //             ? "Task"
                          //             : controller.tabIndex.value == 2
                          //                 ? "Categories"
                          //                 : controller.tabIndex.value == 3
                          //                     ? "Habbit"
                          //                     : controller.tabIndex.value == 4
                          //                         ? "Timer"
                          //                         : ""),
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
                            child: GestureDetector(
                              onTap: () {
                                controller.tabIndex.value == 3
                                    ? habbitSelectController
                                                .habitArcive.value ==
                                            false
                                        ? habbitSelectController
                                            .habitArcive.value = true
                                        : habbitSelectController
                                            .habitArcive.value = false
                                    : const SizedBox();
                                print(habbitSelectController.habitArcive.value);
                              },
                              child: Icon(
                                controller.tabIndex.value == 0
                                    ? Icons.calendar_month
                                    : controller.tabIndex.value == 1
                                        ? Icons.move_to_inbox
                                        : controller.tabIndex.value == 2
                                            ? Icons.category
                                            : controller.tabIndex.value == 3
                                                ? (habbitSelectController
                                                            .habitArcive
                                                            .value ==
                                                        false
                                                    ? Icons.archive_outlined
                                                    : Icons.archive_rounded)
                                                : controller.tabIndex.value == 4
                                                    ? Icons.notifications_active
                                                    : Icons.not_accessible,
                                color: color.disabledColor,
                                size: 30,
                              ),
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
                      const HomePage(),
                      const TaskScreen(),
                      const CategoriesScreen(),
                      habbitSelectController.habitArcive.value == false
                          ? const HabbitsScreen()
                          : const HabbitsArciveScreen(),
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

class SesrchAllDropDown extends StatefulWidget {
  const SesrchAllDropDown({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SesrchAllDropDownState createState() => _SesrchAllDropDownState();
}

class _SesrchAllDropDownState extends State<SesrchAllDropDown> {
// Initial Selected Value
  String dropdownvalue = 'All';

// List of items in our dropdown menu
  var items = [
    'All',
    'Habit',
    'Task',
    'Recurring Task',
  ];
  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.put(
      SearchController(),
    );
    ThemeData color = Theme.of(context);
    return DropdownButton(
      // Initial Value
      underline: SizedBox(),
      value: searchController.searchDropDown.value,
      dropdownColor: color.backgroundColor,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          searchController.searchDropDown.value = newValue!;
        });
      },
    );
  }
}
