// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:intl/intl.dart';

void NameTaskCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddTaskController addTaskController =
            Get.put(AddTaskController(), permanent: false);
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Wrap(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: LabelText(text: "Add Task Name".tr)),
                      SH.large(),
                      const Divider(
                        thickness: 1,
                      ),
                      SH.large(),
                      LabelText(text: "Name".tr),
                      SH.medium(),
                      InputField(
                        hintText: "Name".tr,
                        // controller: addHabbitSelectController.nameCtrl,
                        isWhiteHintText: true,
                        onChange: (p0) {
                          // addHabbitSelectController.updateName.value = p0;
                          addTaskController.taskName.value =
                              toBeginningOfSentenceCase(p0).toString();
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
                              // addTaskController.taskName.refresh();
                            },
                            child: MainLabelText(
                              text: "Add".tr,
                              isColor: true,
                              isBold: true,
                            ),
                          ),
                          SW.large()
                        ],
                      )
                    ]),
              ],
            ));
      });
}
