import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/screens/home_screen.dart';

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
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomePage(),
                HomePage(),
                HomePage(),
                HomePage(),
                HomePage(),
              ],
            )
            ),
        bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),
      ),
    );
  }
}
