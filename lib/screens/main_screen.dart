import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/screens/customize_screen/categories/categories.dart';
import 'package:habbit_app/screens/customize_screen/timer/timer_main_screen.dart';
import 'package:habbit_app/screens/habbit/habbits_screen.dart';
import 'package:habbit_app/screens/home_screen.dart';
import 'package:habbit_app/screens/task_screen/screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../widgets/bottomNavBar.dart';
import 'drawer.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  HomePageController controller =
      Get.put(HomePageController(), permanent: false);
  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ThemeData color = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        drawer: const Drawerr(),
        body: Obx(() => Column(
              children: [
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
                            onTap: () {},
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
            )),
        bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),
      ),
    );
  }
}
