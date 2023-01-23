// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/premiumHabit_dailbox.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void CustomDialogBox(BuildContext context) {
  PremiumController premiumController =
      Get.put(PremiumController(), permanent: false);
  AddRecurringTaskController recurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Wrap(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Icon(
                //       Icons.refresh,
                //       color: color.primaryColor,
                //       size: 30,
                //     ),
                //     SW.large(),
                //     GlobalPadding(
                //       child: Container(
                //         // height: 80,
                //         width: 200,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const MainLabelText(text: "Habit"),
                //             SH.medium(),
                //             const DescriptionText(
                //                 text:
                //                     "Activity that repeats over time. It has detailed tracking and statistics.")
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                // const Divider(thickness: 1),
                GestureDetector(
                  onTap: () {
                    if (premiumController.premium.value == false) {
                      recurringTaskController.tasks.length > 3
                          ? PremiumHabitCustomDialogBox(context)
                          : Get.toNamed('/recurringTask-detail');
                    } else {
                      Get.toNamed('/recurringTask-detail');
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.edit_calendar,
                        color: color.primaryColor,
                        size: 30,
                      ),
                      SW.large(),
                      GlobalPadding(
                        child: Container(
                          // height: 80,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainLabelText(text: "Recurring Task".tr),
                              SH.medium(),
                              DescriptionText(
                                  text:
                                      "Activity that repeats over time without tracking or any statistics."
                                          .tr)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/addtask');
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.task_outlined,
                        color: color.primaryColor,
                        size: 30,
                      ),
                      SW.large(),
                      GlobalPadding(
                        child: Container(
                          // height: 80,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainLabelText(text: "Task".tr),
                              SH.medium(),
                              DescriptionText(
                                  text:
                                      "Single instance activity without tracking over time."
                                          .tr)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
