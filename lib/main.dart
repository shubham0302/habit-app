import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/intro_screen.dart';
import 'package:habbit_app/screens/splash_screen.dart';
import 'package:habbit_app/theme/theme_data.dart';

import 'screens/home_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController(),permanent: true);
// Timer(Duration(seconds: 3), () => Get.to(() => SplashScreen()));
    return Obx(()=> GetMaterialApp(
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 300),
        title: 'Habit',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(context,themeController.isDark,themeController.mode),
        initialRoute: '/',
        getPages: Routes.routes,
        unknownRoute:
            GetPage(name: '/notfound', page: () => const SplashScreen()),
      ),
    );
  }
}

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => MainScreen()),
    GetPage(name: '/intro', page: () => const IntroScreen()),
  ];
}
