// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/controllers/search_controller.dart';
import 'package:habbit_app/screens/categories/categories.dart';
import 'package:habbit_app/screens/customize_screen/components/search_categories_customdailog.dart';
import 'package:habbit_app/screens/timer/timer_main_screen.dart';
import 'package:habbit_app/screens/habbit/habbits_screen.dart';
import 'package:habbit_app/screens/home_screen.dart';
import 'package:habbit_app/screens/task_screen/screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../widgets/bottomNavBar.dart';
import 'drawer.dart';

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

    return Scaffold(
      drawer: const Drawerr(),
      body: Obx(() => SafeArea(
            child: Column(
              children: [
                searchController.searchHome.value
                    ? Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: color.disabledColor.withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 120,
                                // color: color.canvasColor,
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
                                child: GlobalPadding(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const DescriptionText(text: "ALL"),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: color.disabledColor,
                                        size: 25,
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
                                    height: 50,
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
                                    height: 50,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: color.disabledColor
                                              ..withOpacity(0.2),
                                            size: 25,
                                          ),
                                          SW.medium(),
                                          Expanded(
                                            child: TextField(
                                              showCursor: false,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,

                                                  // enabled: false,
                                                  // border: OutlineInputBorder(),
                                                  hintText:
                                                      'Enter a search term',
                                                  hintStyle: TextStyle(
                                                      color:
                                                          color.disabledColor),
                                                  labelStyle: TextStyle(
                                                      color: color.cardColor)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Container(
                                height: 50,
                                width: 130,
                                // color: color.canvasColor,
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                      width: 1,
                                      color:
                                          color.disabledColor.withOpacity(0.2)),
                                )),
                                child: GlobalPadding(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.archive_outlined,
                                        color: color.disabledColor
                                          ..withOpacity(0.2),
                                        size: 25,
                                      ),
                                      Icon(
                                        Icons.delete_outline,
                                        color: color.disabledColor
                                          ..withOpacity(0.2),
                                        size: 25,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          searchController.searchHome.value =
                                              false;
                                          print(searchController
                                              .searchHome.value);
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_up,
                                          color: color.disabledColor
                                            ..withOpacity(0.2),
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      )
                    : const SizedBox(),
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
                              searchController.searchHome.value == true
                                  ? searchController.searchHome.value = false
                                  : searchController.searchHome.value = true;
                              print(searchController.searchHome.value);
                            },
                            child: Icon(
                              Icons.search,
                              color: color.disabledColor,
                              size: 30,
                            ),
                          ),
                          SW.medium(),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              controller.tabIndex.value == 0
                                  ? Icons.calendar_month
                                  : controller.tabIndex.value == 1
                                      ? Icons.move_to_inbox
                                      : controller.tabIndex.value == 2
                                          ? Icons.category
                                          : controller.tabIndex.value == 3
                                              ? Icons.abc
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
