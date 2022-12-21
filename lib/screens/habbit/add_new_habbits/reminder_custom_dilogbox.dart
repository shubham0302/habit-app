// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ReminderCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddHabbitSelectController addHabbitSelectController =
            Get.put(AddHabbitSelectController(), permanent: false);
        return AlertDialog(
          // insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 360,
            height: 480,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MainLabelText(text: "Seletct a Priority"),
                  SH.large(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "9";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "9"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "9"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "8";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "8"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "8"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "7";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "7"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "7"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "6";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "6"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "6"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "5";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "5"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "5"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "4";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "4"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "4"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "3";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "3"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "3"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "2";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "2"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "2"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          addHabbitSelectController.updateReminder.value = "1";
                          Get.back();
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.4))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabelText(text: "1"),
                                SW.small(),
                                addHabbitSelectController
                                            .updateReminder.value ==
                                        "1"
                                    ? Icon(
                                        Icons.flag_rounded,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.flag_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      addHabbitSelectController.updateReminder.value = "0";
                      Get.back();
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: color.disabledColor.withOpacity(0.4))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(text: "0"),
                            SW.small(),
                            addHabbitSelectController.updateReminder.value ==
                                    "0"
                                ? Icon(
                                    Icons.flag_rounded,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.flag_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                          ]),
                    ),
                  ),
                ]),
          ),
        );
      });
}
