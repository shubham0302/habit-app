// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/screens/recurring_task/day_of_month.dart';
import 'package:habbit_app/screens/recurring_task/repeat.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import 'day_of_week.dart';
import 'time_per_period.dart';

void RepetationRecurringCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddRecurringTaskController addRecurringTaskController =
            Get.put(AddRecurringTaskController(), permanent: false);
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
                    const MainLabelText(
                        text: "How often do you want to do it?"),
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
                        child: const LabelText(text: "Everyday")),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          addRecurringTaskController.updateRepetation.value =
                              "Some days of the week";
                          DayOfWeek(context);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: const LabelText(text: "Some days of the week")),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          DayOfMonth(context);
                          addRecurringTaskController.updateRepetation.value =
                              "Specific days of the month";
                        },
                        behavior: HitTestBehavior.translucent,
                        child: const LabelText(
                            text: "Specific day of the month")),
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
                        child:
                            const LabelText(text: "Specific days of the year")),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          addRecurringTaskController.updateRepetation.value =
                              "Some time per period";
                          TimePeriod(context);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: const LabelText(text: "Some time per period")),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    GestureDetector(
                        onTap: () {
                          repeatBox(context);
                          addRecurringTaskController.updateRepetation.value =
                              "Repeat";
                        },
                        behavior: HitTestBehavior.translucent,
                        child: const LabelText(text: "Repeat")),
                    SH.large(),
                  ]),
            ],
          ),
        );
      });

}

