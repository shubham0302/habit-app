// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void repeatBoxHabbit(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddHabbitSelectController addRecurringTaskController =
            Get.put(AddHabbitSelectController(), permanent: false);
        return AlertDialog(
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
                  LabelText(text: '  times per  '),
                  DropdownButton(
                      items: const [
                        DropdownMenuItem(
                            value: 'week',
                            child: LabelText(
                              text: 'Week',
                            )),
                        DropdownMenuItem(
                            value: 'month',
                            child: LabelText(
                              text: 'Month',
                            )),
                        DropdownMenuItem(
                            value: 'year',
                            child: LabelText(
                              text: 'Year',
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
                            const LabelText(text: "Flexible"),
                            SH.small(),
                            const DescriptionText(
                                text:
                                    "It will be shown each day unit completed  ")
                          ],
                        )
                      ],
                    ),
                    Obx(
                      () => addRecurringTaskController.flexible.value == false
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
        );
      });
}
