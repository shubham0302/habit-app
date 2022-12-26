// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ChecklistCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddHabbitSelectController addHabbitSelectController =
            Get.put(AddHabbitSelectController(), permanent: false);
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 360,
            height: 480,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const LabelText(
                      text: "Define your habit",
                      isColor: true,
                    ),
                  ),
                  SH.large(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelText(text: "Checklist"),
                      LabelText(text: "ADD ITEM")
                    ],
                  ),
                  SH.medium(),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) => SH.small(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(children: [
                              Expanded(
                                  child: InputField(hintText: "item name")),
                              Icon(
                                Icons.delete,
                                size: 25,
                                color: color.disabledColor,
                              )
                            ]),
                          ],
                        );
                      },
                    ),
                  ),
                ]),
          ),
        );
      });
}
