// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void CompActCustomDialogBox(BuildContext context) {
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
              height: 230,
              child: Column(
                children: [
                  const DescriptionText(text: "Hide completed activities"),
                  SH.medium(),
                  const Divider(
                      // thickness: 1,
                      ),
                  SH.medium(),
                  const LabelText(
                    text: "Hide",
                    isBold: true,
                    // isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                      // thickness: 1,
                      ),
                  SH.medium(),
                  const LabelText(
                    text: "Keep in place",
                    isBold: true,

                    // isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                      // thickness: 1,
                      ),
                  SH.medium(),
                  const LabelText(
                    text: "Send to bottom",
                    isBold: true,
                    isColor: true,
                  ),
                  SH.medium(),
                  const Divider(
                      // thickness: ,
                      ),
                  SH.medium(),
                  const LabelText(
                    text: "CLOSE",
                    isBold: true,

                    // isColor: true,
                    // color: Color.fromARGB(255, 94, 6, 0),
                  ),
                  // SH.medium(),
                  // Divider(
                  //   thickness: 1,
                  // ),
                  // SH.medium(),
                  // LabelText(
                  //   text: "Friday",
                  //   // isColor: true,
                  // ),
                  // SH.medium(),
                  // Divider(
                  //   thickness: 1,
                  // ),
                  // SH.medium(),
                  // MainLabelText(
                  //   text: "Saturday",
                  //   // isColor: true,
                  // )
                ],
              )),
        );
      });
}
