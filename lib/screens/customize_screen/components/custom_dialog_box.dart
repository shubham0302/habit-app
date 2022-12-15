import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void CustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          title: Container(
            width: 280,
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
                      Container(
                        height: 80,
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(text: "Habit"),
                            SH.medium(),
                            LabelText(
                                text:
                                    "Activity that repeats over time. It has detailed tracking and statistics.")
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.edit_calendar,
                        color: color.primaryColor,
                        size: 30,
                      ),
                      SW.large(),
                      Container(
                        height: 80,
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(text: "Recurring Task"),
                            SH.medium(),
                            LabelText(
                                text:
                                    "Activity that repeats over time without tracking or any statistics.")
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.task_outlined,
                        color: color.primaryColor,
                        size: 30,
                      ),
                      SW.large(),
                      Container(
                        height: 80,
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(text: "Task"),
                            SH.medium(),
                            LabelText(
                                text:
                                    "Single instance activity without tracking over time.")
                          ],
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
