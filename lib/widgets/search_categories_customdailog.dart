// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void SearchCategoryCustomDialogBox(BuildContext context) {
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
              width: 220,
              height: 420,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: DescriptionText(text: "Select s category")),
                    SH.large(),
                    Container(
                      height: 280,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: color.disabledColor
                                                  .withOpacity(0.2)),
                                          child: Icon(
                                            Icons.sports_bar,
                                            color: color.highlightColor,
                                            size: 20,
                                          ),
                                        ),
                                        SW.medium(),
                                        const LabelText(text: "Exercise")
                                      ],
                                    ),
                                    Container(
                                      height: 25,
                                      width: 40,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 5,
                                                //  strokeAlign:StrokeAlign.outside,
                                                color: color.primaryColor
                                                    .withOpacity(0.3)),
                                            color: color.primaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                    const Divider(),
                    SH.medium(),
                    const LabelText(
                      text: "CLEAR SELECTION",
                      isColor: true,
                    ),
                    SH.medium(),
                    const Divider(),
                    SH.medium(),
                    const LabelText(text: "CLOSE")
                  ]),
            ));
      });
}
