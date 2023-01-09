// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ChecklistCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddRecurringTaskController addHabbitSelectController =
            Get.put(AddRecurringTaskController(), permanent: false);
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
                  const Center(
                    child: LabelText(
                      text: "Define your habit",
                      isColor: true,
                    ),
                  ),
                  SH.large(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const LabelText(text: "Checklist"),
                      GestureDetector(
                          onTap: () {
                            addHabbitSelectController.addcheckbox.value =
                                addHabbitSelectController.addcheckbox.value + 1;
                            print(addHabbitSelectController.addcheckbox.value);
                          },
                          child: const LabelText(text: "ADD ITEM"))
                    ],
                  ),
                  SH.medium(),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        itemCount: addHabbitSelectController.addcheckbox.value,
                        separatorBuilder: (context, index) => SH.small(),
                        itemBuilder: (context, index) {
                          return Row(children: [
                            const Expanded(
                                child: InputField(hintText: "item name")),
                            SW.medium(),
                            SW.medium(),
                            SW.medium(),
                            GestureDetector(
                              onTap: () {
                                if (addHabbitSelectController
                                        .addcheckbox.value >
                                    1) {
                                  addHabbitSelectController.addcheckbox.value =
                                      addHabbitSelectController
                                              .addcheckbox.value -
                                          1;
                                }
                                // addHabbitSelectController
                                //             .addcheckbox.value >
                                //         1
                                //     ? addHabbitSelectController
                                //             .addcheckbox.value -
                                //         1
                                //     : ;
                              },
                              child: Icon(
                                Icons.delete,
                                size: 25,
                                color: color.disabledColor,
                              ),
                            )
                          ]);
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainLabelText(text: "BACK"),
                      GestureDetector(
                        onTap: () {},
                        child: const MainLabelText(
                          text: "ADD",
                          isColor: true,
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        );
      });
}
