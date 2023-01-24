// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void TimePeriodHabbit(BuildContext context) {
  AddHabbitSelectController addRecurringTaskController =
      Get.put(AddHabbitSelectController(), permanent: false);
  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: color.backgroundColor,
                content: Wrap(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 60,
                            child: Center(
                                child: InputField(
                              hintText: '1',
                              textType: TextInputType.number,
                              onChange: (e) {
                                addRecurringTaskController.times.value =
                                    int.parse(e);
                              },
                            ))),
                        LabelText(text: '  times per  '.tr),
                        DropdownButton(
                            value: 'week',
                            items: [
                              DropdownMenuItem(
                                  value: "week",
                                  child: LabelText(
                                    text: 'Week'.tr,
                                    isColor: true,
                                  )),
                              DropdownMenuItem(
                                  value: "month",
                                  child: LabelText(
                                    text: 'Month'.tr,
                                    isColor: true,
                                  )),
                              DropdownMenuItem(
                                  value: "year",
                                  child: LabelText(
                                    text: 'Year'.tr,
                                    isColor: true,
                                  )),
                            ],
                            onChanged: (v) {
                              addRecurringTaskController.timeWeek.value =
                                  v.toString();
                            })
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),
                        // DescriptionText(text: 'Monday'),

                        // Column(mainAxisAlignment: MainAxisAlignment.start,
                        //     // crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           Expanded(
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 Checkbox(value: false, onChanged: (v) {

                        //                 }),
                        //                 DescriptionText(text: 'Monday')
                        //               ],
                        //             ),
                        //           ),
                        //           SW.medium(),
                        //           Expanded(
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 Checkbox(value: false, onChanged: (v) {}),
                        //                 DescriptionText(text: 'Tuesday')
                        //               ],
                        //             ),
                        //           ),
                        //           SW.small(),
                        //           Expanded(
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 Checkbox(value: false, onChanged: (v) {}),
                        //                 Expanded(
                        //                     child: DescriptionText(text: 'Wednesday'))
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       SH.small(),
                        //       Row(
                        //         children: [
                        //           Expanded(
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 Checkbox(value: false, onChanged: (v) {}),
                        //                 DescriptionText(text: 'Thursday')
                        //               ],
                        //             ),
                        //           ),
                        //           SW.small(),
                        //           Expanded(
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 Checkbox(value: false, onChanged: (v) {}),
                        //                 DescriptionText(text: 'Friday')
                        //               ],
                        //             ),
                        //           ),
                        //           SW.small(),
                        //           Expanded(
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 Checkbox(value: false, onChanged: (v) {}),
                        //                 DescriptionText(text: 'Saturday')
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       SH.small(),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Row(
                        //             // crossAxisAlignment: CrossAxisAlignment.end,
                        //             children: [
                        //               Checkbox(value: false, onChanged: (v) {}),
                        //               DescriptionText(text: 'Sunday')
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //       SH.small(),
                        //     ]),
                        ,
                      ],
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
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Wrap(
  //       children: [
  //         Row(
  //           children: [
  //             Container(
  //                 width: 60,
  //                 child: Center(
  //                     child: InputField(
  //                   hintText: '1',
  //                   textType: TextInputType.number,
  //                   onChange: (e) {
  //                     addRecurringTaskController.times.value = int.parse(e);
  //                   },
  //                 ))),
  //             LabelText(text: '  times per  '.tr),
  //             DropdownButton(
  //                 value: 'week',
  //                 items: [
  //                   DropdownMenuItem(
  //                       value: "week",
  //                       child: LabelText(
  //                         text: 'Week'.tr,
  //                         isColor: true,
  //                       )),
  //                   DropdownMenuItem(
  //                       value: "month",
  //                       child: LabelText(
  //                         text: 'Month'.tr,
  //                         isColor: true,
  //                       )),
  //                   DropdownMenuItem(
  //                       value: "year",
  //                       child: LabelText(
  //                         text: 'Year'.tr,
  //                         isColor: true,
  //                       )),
  //                 ],
  //                 onChanged: (v) {
  //                   addRecurringTaskController.timeWeek.value =
  //                       v.toString();
  //                 })
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),
  //             // DescriptionText(text: 'Monday'),

  //             // Column(mainAxisAlignment: MainAxisAlignment.start,
  //             //     // crossAxisAlignment: CrossAxisAlignment.center,
  //             //     children: [
  //             //       Row(
  //             //         children: [
  //             //           Expanded(
  //             //             child: Row(
  //             //               // crossAxisAlignment: CrossAxisAlignment.end,
  //             //               children: [
  //             //                 Checkbox(value: false, onChanged: (v) {

  //             //                 }),
  //             //                 DescriptionText(text: 'Monday')
  //             //               ],
  //             //             ),
  //             //           ),
  //             //           SW.medium(),
  //             //           Expanded(
  //             //             child: Row(
  //             //               // crossAxisAlignment: CrossAxisAlignment.end,
  //             //               children: [
  //             //                 Checkbox(value: false, onChanged: (v) {}),
  //             //                 DescriptionText(text: 'Tuesday')
  //             //               ],
  //             //             ),
  //             //           ),
  //             //           SW.small(),
  //             //           Expanded(
  //             //             child: Row(
  //             //               // crossAxisAlignment: CrossAxisAlignment.end,
  //             //               children: [
  //             //                 Checkbox(value: false, onChanged: (v) {}),
  //             //                 Expanded(
  //             //                     child: DescriptionText(text: 'Wednesday'))
  //             //               ],
  //             //             ),
  //             //           ),
  //             //         ],
  //             //       ),
  //             //       SH.small(),
  //             //       Row(
  //             //         children: [
  //             //           Expanded(
  //             //             child: Row(
  //             //               // crossAxisAlignment: CrossAxisAlignment.end,
  //             //               children: [
  //             //                 Checkbox(value: false, onChanged: (v) {}),
  //             //                 DescriptionText(text: 'Thursday')
  //             //               ],
  //             //             ),
  //             //           ),
  //             //           SW.small(),
  //             //           Expanded(
  //             //             child: Row(
  //             //               // crossAxisAlignment: CrossAxisAlignment.end,
  //             //               children: [
  //             //                 Checkbox(value: false, onChanged: (v) {}),
  //             //                 DescriptionText(text: 'Friday')
  //             //               ],
  //             //             ),
  //             //           ),
  //             //           SW.small(),
  //             //           Expanded(
  //             //             child: Row(
  //             //               // crossAxisAlignment: CrossAxisAlignment.end,
  //             //               children: [
  //             //                 Checkbox(value: false, onChanged: (v) {}),
  //             //                 DescriptionText(text: 'Saturday')
  //             //               ],
  //             //             ),
  //             //           ),
  //             //         ],
  //             //       ),
  //             //       SH.small(),
  //             //       Row(
  //             //         mainAxisAlignment: MainAxisAlignment.start,
  //             //         children: [
  //             //           Row(
  //             //             // crossAxisAlignment: CrossAxisAlignment.end,
  //             //             children: [
  //             //               Checkbox(value: false, onChanged: (v) {}),
  //             //               DescriptionText(text: 'Sunday')
  //             //             ],
  //             //           ),
  //             //         ],
  //             //       ),
  //             //       SH.small(),
  //             //     ]),
  //             ,
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // });
}
