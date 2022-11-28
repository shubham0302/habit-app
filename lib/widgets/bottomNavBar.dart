import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/theme_config.dart';

import '../controllers/home_page_controller.dart';

Widget buildBottomNavigationMenu(
    context, int selectedIndex, HomePageController controller) {
  ThemeData color = Theme.of(context);

  final double sizeWidth = MediaQuery.of(context).size.width;
  return Obx(() {
    return BottomAppBar(
      // shape: const CircularNotchedRectangle(),
      color: color.backgroundColor,
      child: Container(
        // margin: const EdgeInsets.all(5),
        width: sizeWidth,
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ThemeConfig.radiusMin),
              topRight: Radius.circular(ThemeConfig.radiusMin)),
          color: ThemeConfig.backgroundColor,
        ),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SW.medium(),
              Expanded(
                child: buildBottomNavItem(() {
                  controller.changeTabIndex(0);
                },
                    controller.tabIndex.value == 0
                        ? Icons.today_outlined
                        : Icons.today_outlined,
                    controller.tabIndex.value == 0,
                    'Today',
                    context),
              ),
              SW.medium(),
              Expanded(
                child: buildBottomNavItem(() {
                  controller.changeTabIndex(1);
                },
                    controller.tabIndex.value == 1
                        ? Icons.stars_rounded
                        : Icons.stars,
                    controller.tabIndex.value == 1,
                    'Habits',
                    context),
              ),
              SW.medium(),
              Expanded(
                child: buildBottomNavItem(() {
                  controller.changeTabIndex(2);
                },
                    controller.tabIndex.value == 2
                        ? Icons.task_alt_outlined
                        : Icons.task_alt,
                    controller.tabIndex.value == 2,
                    'Tasks',
                    context),
              ),
              SW.medium(),
              Expanded(
                child: buildBottomNavItem(() {
                  controller.changeTabIndex(3);
                },
                    controller.tabIndex.value == 3
                        ? Icons.category
                        : Icons.category_outlined,
                    controller.tabIndex.value == 3,
                    'Categories',
                    context),
              ),
              SW.medium(),
              Expanded(
                child: buildBottomNavItem(() {
                  controller.changeTabIndex(4);
                }, controller.tabIndex.value == 4 ? Icons.timer : Icons.timer,
                    controller.tabIndex.value == 4, 'Timer', context),
              ),
              SW.medium(),
            ],
          ),
        ),
      ),
    );
  });
}

BottomNavigationBarItem buildBottomItems(IconData icon, String label) {
  return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 15.00,
      ),
      label: label);
}

Widget buildBottomNavItem(
    VoidCallback op, IconData icon, bool selected, String lable, context) {
  ThemeData color = Theme.of(context);

  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: op,
    child: Column(
      children: [
        SH.small(),
        AnimatedContainer(
            duration: Duration(milliseconds: 400),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selected ? color.cardColor : Colors.transparent,
            ),
            child: selected
                ? Icon(
                    icon,
                    color: ThemeConfig.mainTextColor,
                  )
                : Container(
                    child: Center(
                      child: Icon(
                        icon,
                        color: color.hintColor,
                      ),
                    ),
                  )),
        SH.small(),
        Expanded(
          child: Text(
            lable,
            style: TextStyle(
              color: ThemeConfig.mainTextColor,
              fontSize: 12,
              // fontSize: selected ? 10 : 10,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        )
      ],
    ),
  );
}
