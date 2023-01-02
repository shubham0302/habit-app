import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../controllers/lockpin_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  LockPinController switchController =
      Get.put(LockPinController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {});
    return const Scaffold(
      body: Center(
          child: MainLabelText(
        text: "Welcome",
      )),
    );
  }
}
