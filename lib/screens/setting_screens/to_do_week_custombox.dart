// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ToDoWeekCustomDialogBox(BuildContext context) {
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
              height: 340,
              child: Column(
                children: [
                  const MainLabelText(text: "First day of week"),
                  SH.medium(),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.medium(),
                  const LabelText(
                    text: "Sunday",
                    isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.medium(),
                  const LabelText(
                    text: "Monday",
                    // isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.medium(),
                  const LabelText(
                    text: "Tuesday",
                    // isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.medium(),
                  const LabelText(
                    text: "Thursday",
                    // isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.medium(),
                  const LabelText(
                    text: "Friday",
                    // isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                    thickness: 1,
                  ),
                  SH.medium(),
                  const LabelText(
                    text: "Saturday",
                    // isColor: true,
                  )
                ],
              )),
        );
      });
}
