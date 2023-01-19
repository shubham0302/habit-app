// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:habbit_app/screens/customize_screen/timer/timer_main_screen.dart';
import 'package:habbit_app/screens/timer/timer_main_screen.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../../../widgets/padding.dart';

class DrawerTimer extends StatelessWidget {
  const DrawerTimer({super.key});

  @override
  Widget build(BuildContext context) {
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GlobalPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (() {
                            Get.back();
                          }),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: color.primaryColor,
                            ),
                          )),
                      SW.medium(),
                      MainLabelText(text: 'Timer'.tr),
                    ],
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.purpleAccent.shade100
                    ),
                    child: Icon(
                      Icons.volume_up,
                      size: 30,
                      color: color.disabledColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            // SH.large(),
            // SH.large(),

            // TimerMainScreen()
            Expanded(child: TimerMainScreen())
          ],
        ),
      ),
    );
  }
}
