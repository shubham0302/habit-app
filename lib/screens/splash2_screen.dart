import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/lang_ctrl.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../controllers/lockpin_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  LockPinController switchController =
      Get.put(LockPinController(), permanent: true);
  LanguageController languageController =
      Get.put(LanguageController(), permanent: true);
  DBController ctrl = Get.put(DBController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {});
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('assets/images/Logo.png')),
    );
  }
}
