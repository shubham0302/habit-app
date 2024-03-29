// ignore_for_file: unused_local_variable, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/interval_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:numberpicker/numberpicker.dart';

class SetIntervalComponent extends StatefulWidget {
  final VoidCallback changeAnimation;
  const SetIntervalComponent({super.key, required this.changeAnimation});

  @override
  State<SetIntervalComponent> createState() => _SetIntervalComponentState();
}

class _SetIntervalComponentState extends State<SetIntervalComponent> {
  @override
  Widget build(BuildContext context) {
    late AnimationController animationController;
    // ignore: todo
    // TODO: implement initState
    IntervalTabController intervalTabController =
        Get.put(IntervalTabController(), permanent: false);
    // TimerMainScreen timerMainScreen =
    //     Get.put(TimerMainScreen(), permanent: false);

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
                  DescriptionText(text: "Hours".tr),
                  SH.small(),
                  NumberPicker(
                    // itemCount: 12,
                    infiniteLoop: true,
                    value: intervalTabController.currentvalueHour.value,
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
                    onChanged: (value) => setState(() =>
                        intervalTabController.currentvalueHour.value = value),
                  ),
                ],
              ),
              Text(
                ":",
                style: TextStyle(color: color.primaryColor, fontSize: 50),
              ),
              Column(
                children: [
                  DescriptionText(text: "Minutes".tr),
                  SH.small(),
                  NumberPicker(
                    // itemCount: 12,
                    infiniteLoop: true,
                    value: intervalTabController.currentvalueMin.value,
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
                    onChanged: (value) => setState(() =>
                        intervalTabController.currentvalueMin.value = value),
                  ),
                ],
              ),
              Text(
                ":",
                style: TextStyle(color: color.primaryColor, fontSize: 50),
              ),
              Column(
                children: [
                  DescriptionText(text: "Seconds".tr),
                  SH.small(),
                  NumberPicker(
                    // itemCount: 12,
                    infiniteLoop: true,
                    value: intervalTabController.currentvalueSec.value,
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
                    onChanged: (value) => setState(() =>
                        intervalTabController.currentvalueSec.value = value),
                  ),
                ],
              ),
              SH.large(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.disabledColor.withOpacity(0.10)),
                child: const Center(child: DescriptionText(text: "00.00.00")),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.disabledColor.withOpacity(0.10)),
                child: const Center(child: DescriptionText(text: "00.00.00")),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.disabledColor.withOpacity(0.10)),
                child: const Center(child: DescriptionText(text: "00.00.00")),
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
                child: Center(
                    child: LabelText(
                  text: "START".tr,
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
