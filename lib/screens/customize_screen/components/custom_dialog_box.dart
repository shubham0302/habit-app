// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void CustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 280,
            height: 300,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.refresh,
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
                              const MainLabelText(text: "Habit"),
                              SH.medium(),
                              const DescriptionText(
                                  text:
                                      "Activity that repeats over time. It has detailed tracking and statistics.")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(thickness: 1),
                  Row(
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
                              const MainLabelText(text: "Recurring Task"),
                              SH.medium(),
                              const DescriptionText(
                                  text:
                                      "Activity that repeats over time without tracking or any statistics.")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(thickness: 1),
                  Row(
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
                              const MainLabelText(text: "Task"),
                              SH.medium(),
                              const DescriptionText(
                                  text:
                                      "Single instance activity without tracking over time.")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // Divider(thickness: 1),
                ]),
          ),
        );
      });
}
