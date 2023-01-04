// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/lockpin_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/language/localString.dart';
import 'package:habbit_app/screens/categories/categories.dart';
import 'package:habbit_app/screens/categories/categories_drawer_screen.dart';
import 'package:habbit_app/screens/getpremium_screen.dart';
import 'package:habbit_app/screens/customize_screen/screen.dart';
import 'package:habbit_app/screens/pin/pin_screen.dart';
import 'package:habbit_app/screens/recurring_task/add_recurring_task_screen.dart';
import 'package:habbit_app/screens/setting_screens/setting_screen.dart';
import 'package:habbit_app/screens/setting_screens/licenses_screen.dart';
import 'package:habbit_app/screens/setting_screens/lock_screen.dart';
import 'package:habbit_app/screens/setting_screens/notification_alarm_screen.dart';
import 'package:habbit_app/screens/setting_screens/todohabbit_screen.dart';
import 'package:habbit_app/screens/splash2_screen.dart';
import 'package:habbit_app/screens/task_screen/add_task_screen.dart';
import 'package:habbit_app/screens/task_screen/edit_task_screen.dart';
import 'package:habbit_app/screens/timer/drawer_timer.dart';
import 'package:habbit_app/screens/habbit/habbit_detailScreen.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/add_new_habbits.dart';
import 'package:habbit_app/screens/habbit/habbits_screen.dart';
import 'package:habbit_app/screens/intro_screen.dart';
import 'package:habbit_app/screens/splash_screen.dart';
import 'package:habbit_app/theme/theme_data.dart';
import 'screens/backup_screen.dart';
import 'screens/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  LockPinController lockPinController =
      Get.put(LockPinController(), permanent: true);
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        lockPinController.getPinTypeResume();

        break;

      case AppLifecycleState.inactive:
        // lockPinController.getPinTypeResume();
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController themeController =
        Get.put(ThemeController(), permanent: true);
    DBController dbController = Get.put(DBController(), permanent: true);
// Timer(Duration(seconds: 3), () => Get.to(() => SplashScreen()));
    return Obx(
      () => GetMaterialApp(
        translations: LocalString(),
        locale: Locale('en', 'US'),
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 300),
        title: 'Habit',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(
          context,
          themeController.mode,
        ),
        darkTheme: Styles.darkThemeData(
          context,
          themeController.mode,
        ),
        initialRoute: '/',
        getPages: Routes.routes,
        themeMode: themeController.themeModeData['value'] == 'default'
            ? ThemeMode.system
            : themeController.themeModeData['value'] == 'dark'
                ? ThemeMode.dark
                : ThemeMode.light,
        unknownRoute: GetPage(name: '/notfound', page: () => const Splash()),
      ),
    );
  }
}

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const Splash()),
    GetPage(name: '/home', page: () => MainScreen()),
    GetPage(name: '/intro', page: () => const IntroScreen()),
    GetPage(name: '/customize', page: () => const CustomizeScreen()),
    GetPage(name: '/backup', page: () => const BackUpScreen()),
    GetPage(name: '/getpremium', page: () => const GetPremiumScreen()),
    GetPage(name: '/setting', page: () => const SettingScreen()),
    GetPage(name: "/todo", page: () => const ToDoHabbitListScreen()),
    GetPage(
        name: '/notiandalarm', page: () => const NotificationandAlarmScreen()),
    GetPage(name: "/lock", page: () => const LockScreen()),
    GetPage(name: "/lic", page: () => const LicScreen()),
    GetPage(name: "/timer", page: () => const DrawerTimer()),
    GetPage(name: "/categories", page: () => const CategoriesScreen()),
    GetPage(
        name: "/categoriesdrawer", page: () => const CategoriesDrawerScreen()),
    GetPage(name: "/habbit", page: () => const HabbitsScreen()),
    GetPage(name: "/addhabbit", page: () => const AddHabbitsScreen()),
    GetPage(name: "/habbit-detail", page: () => const HabbitDetailScreen()),
    GetPage(
        name: "/recurringTask-detail",
        page: () => const AddRecurringTaskScreen()),
    GetPage(name: "/addtask", page: () => const AddTaskScreen()),
    GetPage(name: "/edittask", page: () => const EditTask()),
    GetPage(name: "/splash", page: () => const Splash()),
    GetPage(name: "/pin", page: () => const PinScreen()),
  ];
}
