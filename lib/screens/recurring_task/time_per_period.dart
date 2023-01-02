// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void TimePeriod(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddRecurringTaskController addRecurringTaskController =
            Get.put(AddRecurringTaskController(), permanent: false);
        return AlertDialog(
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
                      child: Center(child: InputField(hintText: '1'))),
                  LabelText(text: '  times per  '),
                  DropdownButton(items: [
                    DropdownMenuItem(
                        child: LabelText(
                      text: 'Week',
                    )),
                  ], onChanged: (v) {})
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
        );
      });
}
