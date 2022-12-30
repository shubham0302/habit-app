// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/main.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void ChecklistTaskCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddTaskController addHabbitSelectController =
            Get.put(AddTaskController(), permanent: false);
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
                            addHabbitSelectController.checklist
                                .add(TextEditingController(text: ''));
                            // addHabbitSelectController.addcheckbox.value =
                            //     addHabbitSelectController.addcheckbox.value + 1;
                            // print(addHabbitSelectController.addcheckbox.value);
                          },
                          child: const LabelText(text: "ADD ITEM"))
                    ],
                  ),
                  SH.large(),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        itemCount: addHabbitSelectController.checklist.length,
                        separatorBuilder: (context, index) => SH.medium(),
                        itemBuilder: (context, index) {
                          return Column(
                            // key: ObjectKey(
                            //     addHabbitSelectController.checklist[index]),
                            children: [
                              Row(
                                  // key: ValueKey(addHabbitSelectController
                                  //     .checklist[index]),
                                  children: [
                                    Expanded(
                                        child: InputField(
                                      controller: addHabbitSelectController
                                          .checklist[index],
                                      // key: ValueKey(addHabbitSelectController
                                      //     .checklist[index]),
                                      hintText: "item name",
                                      onChange: (e) {
                                        // addHabbitSelectController
                                        //     .checklist[index] = e;
                                        // addHabbitSelectController.checklist.add(e);
                                      },
                                    )),
                                    SW.medium(),
                                    GestureDetector(
                                      onTap: () {
                                        if (addHabbitSelectController
                                                .checklist.length >
                                            1) {
                                          addHabbitSelectController.checklist
                                              .removeAt(index);
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
                                  ]),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        behavior: HitTestBehavior.translucent,
                        child: const LabelText(
                          text: "BACK",
                          isBold: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const LabelText(
                          isBold: true,
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
