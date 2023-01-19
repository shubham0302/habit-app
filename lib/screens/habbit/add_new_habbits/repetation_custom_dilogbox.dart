// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/day_of_month.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/day_of_week.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/repeat.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/time_per_period.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void RepetationCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddHabbitSelectController addRecurringTaskController =
            Get.put(AddHabbitSelectController(), permanent: false);
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Wrap(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainLabelText(text: "How often do you want to do it?".tr),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          addRecurringTaskController.updateRepetation.value =
                              "Everyday";
                          Get.back();
                        },
                        behavior: HitTestBehavior.translucent,
                        child: LabelText(text: "Everyday".tr)),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          addRecurringTaskController.updateRepetation.value =
                              "Some days of the week";
                          DayOfWeekHabbit(context);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: LabelText(text: "Some days of the week".tr)),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          DayOfMonthHabbit(context);
                          addRecurringTaskController.updateRepetation.value =
                              "Specific days of the month";
                        },
                        behavior: HitTestBehavior.translucent,
                        child: LabelText(text: "Specific day of the month".tr)),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          addRecurringTaskController.repiDate(context);
                          addRecurringTaskController.updateRepetation.value =
                              "Specific day of the year";
                        },
                        behavior: HitTestBehavior.translucent,
                        child: LabelText(text: "Specific days of the year".tr)),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          addRecurringTaskController.updateRepetation.value =
                              "Some time per period";
                          TimePeriodHabbit(context);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: LabelText(text: "Some time per period".tr)),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          repeatBoxHabbit(context);
                          addRecurringTaskController.updateRepetation.value =
                              "Repeat";
                        },
                        behavior: HitTestBehavior.translucent,
                        child: LabelText(text: "Repeat".tr)),
                    SH.large(),
                  ]),
            ],
          ),
        );
      });
}
