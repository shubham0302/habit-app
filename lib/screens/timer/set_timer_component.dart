// ignore_for_file: unused_local_variable, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/timer/timer_main_screen.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:numberpicker/numberpicker.dart';

class SetTimerComponent extends StatefulWidget {
  final VoidCallback changeAnimation;
  const SetTimerComponent({super.key, required this.changeAnimation});

  @override
  State<SetTimerComponent> createState() => _SetTimerComponentState();
}

class _SetTimerComponentState extends State<SetTimerComponent> {
  @override
  Widget build(BuildContext context) {
    late AnimationController animationController;
    // ignore: todo
    // TODO: implement initState
    TimerTabController tabController =
        Get.put(TimerTabController(), permanent: false);
    TimerMainScreen timerMainScreen =
        Get.put(TimerMainScreen(), permanent: false);

    var color = Theme.of(context);
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const DescriptionText(text: "Hour"),
                  SH.small(),
                  NumberPicker(
                    // itemCount: 12,
                    infiniteLoop: true,
                    value: tabController.currentvalueHour.value,
                    minValue: 0,
                    maxValue: 12,
                    itemHeight: 80,
                    textStyle: TextStyle(
                        color: color.primaryColor.withOpacity(0.5),
                        fontSize: 35,
                        fontWeight: FontWeight.w200),
                    selectedTextStyle: TextStyle(
                        color: color.primaryColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w400),
                    onChanged: (value) => setState(
                        () => tabController.currentvalueHour.value = value),
                  ),
                ],
              ),
              Text(
                ":",
                style: TextStyle(color: color.primaryColor, fontSize: 50),
              ),
              Column(
                children: [
                  const DescriptionText(text: "Minutes"),
                  SH.small(),
                  NumberPicker(
                    // itemCount: 12,
                    infiniteLoop: true,
                    value: tabController.currentvalueMin.value,
                    minValue: 0,
                    maxValue: 60,
                    itemHeight: 80,
                    textStyle: TextStyle(
                        color: color.primaryColor.withOpacity(0.5),
                        fontSize: 35,
                        fontWeight: FontWeight.w200),
                    selectedTextStyle: TextStyle(
                        color: color.primaryColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w400),
                    onChanged: (value) => setState(
                        () => tabController.currentvalueMin.value = value),
                  ),
                ],
              ),
              Text(
                ":",
                style: TextStyle(color: color.primaryColor, fontSize: 50),
              ),
              Column(
                children: [
                  const DescriptionText(text: "Seconds"),
                  SH.small(),
                  NumberPicker(
                    // itemCount: 12,
                    infiniteLoop: true,
                    value: tabController.currentvalueSec.value,
                    minValue: 0,
                    maxValue: 60,
                    itemHeight: 80,
                    textStyle: TextStyle(
                        color: color.primaryColor.withOpacity(0.5),
                        fontSize: 35,
                        fontWeight: FontWeight.w200),
                    selectedTextStyle: TextStyle(
                        color: color.primaryColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w400),
                    onChanged: (value) => setState(
                        () => tabController.currentvalueSec.value = value),
                  ),
                ],
              ),
              SH.large(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  tabController.currentvalueHour.value = 00;
                  tabController.currentvalueMin.value = 10;
                  tabController.currentvalueSec.value = 00;
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.disabledColor.withOpacity(0.10)),
                  child: const Center(child: DescriptionText(text: "00.10.00")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  tabController.currentvalueHour.value = 00;
                  tabController.currentvalueMin.value = 20;
                  tabController.currentvalueSec.value = 00;
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.disabledColor.withOpacity(0.10)),
                  child: const Center(child: DescriptionText(text: "00.20.00")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  tabController.currentvalueHour.value = 00;
                  tabController.currentvalueMin.value = 30;
                  tabController.currentvalueSec.value = 00;
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.disabledColor.withOpacity(0.10)),
                  child: const Center(child: DescriptionText(text: "00.30.00")),
                ),
              )
            ],
          ),
          SH.large(),
          SH.large(),
          SH.large(),
          Center(
            child: GestureDetector(
              onTap: () {
                widget.changeAnimation();
                // tabController.changeFirst();
                // print(tabController.changeFirst());
                // print(tabController.totalSeconds);
              },
              child: Container(
                height: 35,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: color.primaryColor),
                child: const Center(
                    child: LabelText(
                  text: "START",
                  isBold: true,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
