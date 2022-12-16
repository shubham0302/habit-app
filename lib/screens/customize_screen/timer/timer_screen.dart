import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/customize_screen/timer/timer_main_screen.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: color.primaryColor,
                        size: 20,
                      ),
                    ),
                    SW.medium(),
                    const HeadingText(text: "Timer"),
                  ],
                ),
                Icon(
                  Icons.volume_up,
                  size: 30,
                  color: color.disabledColor,
                )
              ],
            ),
            SH.large(),
            SH.large(),
            SH.large(),
            TimerMainScreen()
          ],
        ),
      )),
    );
  }
}
