// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void repeatBox(BuildContext context) {
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
                insetPadding: const EdgeInsets.symmetric(horizontal: 15),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: color.backgroundColor,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 60,
                            child: Center(
                                child: InputField(
                              hintText: '1',
                              onChange: (e) {
                                addRecurringTaskController.repeatTime.value =
                                    int.parse(e);
                              },
                            ))),
                        LabelText(text: '  times per  '.tr),
                        DropdownButton(
                            items: [
                              DropdownMenuItem(
                                  value: 'week',
                                  child: LabelText(
                                    text: 'Week'.tr,
                                  )),
                              DropdownMenuItem(
                                  value: 'month',
                                  child: LabelText(
                                    text: 'Month'.tr,
                                  )),
                              DropdownMenuItem(
                                  value: 'year',
                                  child: LabelText(
                                    text: 'Year'.tr,
                                  )),
                            ],
                            onChanged: (v) {
                              addRecurringTaskController.repeatPeriod.value =
                                  v.toString();
                            }),
                      ],
                    ),
                    SH.medium(),
                    GestureDetector(
                      onTap: () {
                        addRecurringTaskController.flexible.value == true
                            ? addRecurringTaskController.flexible.value = false
                            : addRecurringTaskController.flexible.value = true;
                        print(addRecurringTaskController.flexible.value);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 25,
                                color: color.primaryColor,
                              ),
                              SW.medium(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelText(text: "Flexible".tr),
                                  SH.small(),
                                  DescriptionText(
                                      text:
                                          "It will be shown each day unit completed  "
                                              .tr)
                                ],
                              )
                            ],
                          ),
                          Obx(
                            () => addRecurringTaskController.flexible.value ==
                                    false
                                ? Icon(
                                    Icons.circle_outlined,
                                    size: 25,
                                    color: color.primaryColor,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: color.primaryColor,

                                    size: 25,
                                    // color: color.disabledColor,
                                  ),
                          )
                        ],
                      ),
                    ),
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
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 15),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Row(
  //           children: [
  //             Container(
  //                 width: 60,
  //                 child: Center(
  //                     child: InputField(
  //                   hintText: '1',
  //                   onChange: (e) {
  //                     addRecurringTaskController.repeatTime.value =
  //                         int.parse(e);
  //                   },
  //                 ))),
  //             LabelText(text: '  times per  '.tr),
  //             DropdownButton(
  //                 items: [
  //                   DropdownMenuItem(
  //                       value: 'week',
  //                       child: LabelText(
  //                         text: 'Week'.tr,
  //                       )),
  //                   DropdownMenuItem(
  //                       value: 'month',
  //                       child: LabelText(
  //                         text: 'Month'.tr,
  //                       )),
  //                   DropdownMenuItem(
  //                       value: 'year',
  //                       child: LabelText(
  //                         text: 'Year'.tr,
  //                       )),
  //                 ],
  //                 onChanged: (v) {
  //                   addRecurringTaskController.repeatPeriod.value =
  //                       v.toString();
  //                 }),
  //           ],
  //         ),
  //         SH.medium(),
  //         GestureDetector(
  //           onTap: () {
  //             addRecurringTaskController.flexible.value == true
  //                 ? addRecurringTaskController.flexible.value = false
  //                 : addRecurringTaskController.flexible.value = true;
  //             print(addRecurringTaskController.flexible.value);
  //           },
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   Icon(
  //                     Icons.calendar_month_outlined,
  //                     size: 25,
  //                     color: color.primaryColor,
  //                   ),
  //                   SW.medium(),
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       LabelText(text: "Flexible".tr),
  //                       SH.small(),
  //                       DescriptionText(
  //                           text:
  //                               "It will be shown each day unit completed  "
  //                                   .tr)
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Obx(
  //                 () => addRecurringTaskController.flexible.value == false
  //                     ? Icon(
  //                         Icons.circle_outlined,
  //                         size: 25,
  //                         color: color.primaryColor,
  //                       )
  //                     : Icon(
  //                         Icons.check_circle,
  //                         color: color.primaryColor,

  //                         size: 25,
  //                         // color: color.disabledColor,
  //                       ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // });
}
