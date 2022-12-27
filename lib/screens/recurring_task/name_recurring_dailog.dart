// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void NameRecurringCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddRecurringTaskController addRecurringTaskController =
            Get.put(AddRecurringTaskController(), permanent: false);
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Container(
              width: 280,
              height: 320,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: LabelText(text: "Name and description")),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    const LabelText(text: "Name"),
                    SH.medium(),
                    InputField(
                      hintText: "Name",
                      controller: addRecurringTaskController.nameCtrl,
                      isWhiteHintText: true,
                      onChange: (p0) {
                        addRecurringTaskController.updateName.value = p0;
                      },
                    ),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.large(),
                    const LabelText(text: "Description"),
                    SH.medium(),
                    InputField(
                      hintText: "Description",
                      controller: addRecurringTaskController.descriptionCtrl,
                      isWhiteHintText: true,
                      onChange: (p1) {
                        addRecurringTaskController.updateDescription.value = p1;
                      },
                    ),
                    SH.large(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.medium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const MainLabelText(
                            text: "Add",
                            isColor: true,
                            isBold: true,
                          ),
                        ),
                        SW.large()
                      ],
                    )
                  ]),
            ));
      });
}
