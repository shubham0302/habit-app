import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed("/intro");
    });
    return const Scaffold(
      body: Center(
          child: MainLabelText(
        text: "Welcome",
      )),
    );
  }
}
