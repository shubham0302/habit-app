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
  AddRecurringTaskController addRecurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);
  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: color.backgroundColor,
                content: Wrap(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MainLabelText(
                              text: "How often do you want to do it?".tr),
                          SH.large(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.large(),
                          GestureDetector(
                              onTap: () {
                                addRecurringTaskController
                                    .updateRepetation.value = "Everyday";
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
                                addRecurringTaskController.updateRepetation
                                    .value = "Some days of the week";
                                DayOfWeek(context);
                              },
                              behavior: HitTestBehavior.translucent,
                              child:
                                  LabelText(text: "Some days of the week".tr)),
                          SH.large(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.large(),
                          GestureDetector(
                              onTap: () {
                                DayOfMonth(context);
                                addRecurringTaskController.updateRepetation
                                    .value = "Specific days of the month";
                              },
                              behavior: HitTestBehavior.translucent,
                              child: LabelText(
                                  text: "Specific day of the month".tr)),
                          SH.large(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.large(),
                          GestureDetector(
                              onTap: () {
                                addRecurringTaskController.repiDate(context);
                                addRecurringTaskController.updateRepetation
                                    .value = "Specific day of the year";
                              },
                              behavior: HitTestBehavior.translucent,
                              child: LabelText(
                                  text: "Specific days of the year".tr)),
                          SH.large(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.large(),
                          GestureDetector(
                              onTap: () {
                                addRecurringTaskController.updateRepetation
                                    .value = "Some time per period";
                                TimePeriod(context);
                              },
                              behavior: HitTestBehavior.translucent,
                              child:
                                  LabelText(text: "Some time per period".tr)),
                          SH.large(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.large(),
                          GestureDetector(
                              onTap: () {
                                repeatBox(context);
                                addRecurringTaskController
                                    .updateRepetation.value = "Repeat";
                              },
                              behavior: HitTestBehavior.translucent,
                              child: LabelText(text: "Repeat".tr)),
                          SH.large(),
                        ]),
                  ],
                ),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //   return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Wrap(
  //       children: [
  //         Column(mainAxisAlignment: MainAxisAlignment.start,
  //             // crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               MainLabelText(text: "How often do you want to do it?".tr),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               GestureDetector(
  //                   onTap: () {
  //                     addRecurringTaskController.updateRepetation.value =
  //                         "Everyday";
  //                     Get.back();
  //                   },
  //                   behavior: HitTestBehavior.translucent,
  //                   child: LabelText(text: "Everyday".tr)),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               GestureDetector(
  //                   onTap: () {
  //                     addRecurringTaskController.updateRepetation.value =
  //                         "Some days of the week";
  //                     DayOfWeek(context);
  //                   },
  //                   behavior: HitTestBehavior.translucent,
  //                   child: LabelText(text: "Some days of the week".tr)),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               GestureDetector(
  //                   onTap: () {
  //                     DayOfMonth(context);
  //                     addRecurringTaskController.updateRepetation.value =
  //                         "Specific days of the month";
  //                   },
  //                   behavior: HitTestBehavior.translucent,
  //                   child: LabelText(text: "Specific day of the month".tr)),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               GestureDetector(
  //                   onTap: () {
  //                     addRecurringTaskController.repiDate(context);
  //                     addRecurringTaskController.updateRepetation.value =
  //                         "Specific day of the year";
  //                   },
  //                   behavior: HitTestBehavior.translucent,
  //                   child: LabelText(text: "Specific days of the year".tr)),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               GestureDetector(
  //                   onTap: () {
  //                     addRecurringTaskController.updateRepetation.value =
  //                         "Some time per period";
  //                     TimePeriod(context);
  //                   },
  //                   behavior: HitTestBehavior.translucent,
  //                   child: LabelText(text: "Some time per period".tr)),
  //               SH.large(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.large(),
  //               GestureDetector(
  //                   onTap: () {
  //                     repeatBox(context);
  //                     addRecurringTaskController.updateRepetation.value =
  //                         "Repeat";
  //                   },
  //                   behavior: HitTestBehavior.translucent,
  //                   child: LabelText(text: "Repeat".tr)),
  //               SH.large(),
  //             ]),
  //       ],
  //     ),
  //   );
  // });
}
