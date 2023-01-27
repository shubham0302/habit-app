// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void ChecklistTaskCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);

  AddTaskController addHabbitSelectController =
      Get.put(AddTaskController(), permanent: false);
  AddTaskController addTaskController =
      Get.put(AddTaskController(), permanent: false);
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
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
                          child: LabelText(
                            text: "Define your habit".tr,
                            isColor: true,
                          ),
                        ),
                        SH.large(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelText(text: "Checklist".tr),
                            GestureDetector(
                                onTap: () {
                                  addHabbitSelectController.checklist
                                      .add(TextEditingController(text: ''));
                                  // addHabbitSelectController.addcheckbox.value =
                                  //     addHabbitSelectController.addcheckbox.value + 1;
                                  // print(addHabbitSelectController.addcheckbox.value);
                                },
                                child: LabelText(text: "ADD ITEM".tr))
                          ],
                        ),
                        SH.large(),
                        Expanded(
                          child: Obx(
                            () => ListView.separated(
                              itemCount:
                                  addHabbitSelectController.checklist.length,
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
                                            controller:
                                                addHabbitSelectController
                                                    .checklist[index],
                                            // key: ValueKey(addHabbitSelectController
                                            //     .checklist[index]),
                                            hintText: "item name".tr,
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
                                                addHabbitSelectController
                                                    .checklist
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
                              child: LabelText(
                                text: "BACK".tr,
                                isBold: true,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addTaskController.selectEvaluate.value =
                                    'Checklist';
                              },
                              child: LabelText(
                                isBold: true,
                                text: "ADD".tr,
                                isColor: true,
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       AddTaskController addHabbitSelectController =
  //           Get.put(AddTaskController(), permanent: false);
  //       return AlertDialog(
  //         insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //         shape: const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //         backgroundColor: color.backgroundColor,
  //         content: Container(
  //           width: 360,
  //           height: 480,
  //           child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Center(
  //                   child: LabelText(
  //                     text: "Define your habit".tr,
  //                     isColor: true,
  //                   ),
  //                 ),
  //                 SH.large(),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     LabelText(text: "Checklist".tr),
  //                     GestureDetector(
  //                         onTap: () {
  //                           addHabbitSelectController.checklist
  //                               .add(TextEditingController(text: ''));
  //                           // addHabbitSelectController.addcheckbox.value =
  //                           //     addHabbitSelectController.addcheckbox.value + 1;
  //                           // print(addHabbitSelectController.addcheckbox.value);
  //                         },
  //                         child: LabelText(text: "ADD ITEM".tr))
  //                   ],
  //                 ),
  //                 SH.large(),
  //                 Expanded(
  //                   child: Obx(
  //                     () => ListView.separated(
  //                       itemCount: addHabbitSelectController.checklist.length,
  //                       separatorBuilder: (context, index) => SH.medium(),
  //                       itemBuilder: (context, index) {
  //                         return Column(
  //                           // key: ObjectKey(
  //                           //     addHabbitSelectController.checklist[index]),
  //                           children: [
  //                             Row(
  //                                 // key: ValueKey(addHabbitSelectController
  //                                 //     .checklist[index]),
  //                                 children: [
  //                                   Expanded(
  //                                       child: InputField(
  //                                     controller: addHabbitSelectController
  //                                         .checklist[index],
  //                                     // key: ValueKey(addHabbitSelectController
  //                                     //     .checklist[index]),
  //                                     hintText: "item name".tr,
  //                                     onChange: (e) {
  //                                       // addHabbitSelectController
  //                                       //     .checklist[index] = e;
  //                                       // addHabbitSelectController.checklist.add(e);
  //                                     },
  //                                   )),
  //                                   SW.medium(),
  //                                   GestureDetector(
  //                                     onTap: () {
  //                                       if (addHabbitSelectController
  //                                               .checklist.length >
  //                                           1) {
  //                                         addHabbitSelectController.checklist
  //                                             .removeAt(index);
  //                                       }
  //                                       // addHabbitSelectController
  //                                       //             .addcheckbox.value >
  //                                       //         1
  //                                       //     ? addHabbitSelectController
  //                                       //             .addcheckbox.value -
  //                                       //         1
  //                                       //     : ;
  //                                     },
  //                                     child: Icon(
  //                                       Icons.delete,
  //                                       size: 25,
  //                                       color: color.disabledColor,
  //                                     ),
  //                                   )
  //                                 ]),
  //                           ],
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     GestureDetector(
  //                       onTap: () {
  //                         Get.back();
  //                       },
  //                       behavior: HitTestBehavior.translucent,
  //                       child: LabelText(
  //                         text: "BACK".tr,
  //                         isBold: true,
  //                       ),
  //                     ),
  //                     GestureDetector(
  //                       onTap: () {},
  //                       child: LabelText(
  //                         isBold: true,
  //                         text: "ADD".tr,
  //                         isColor: true,
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ]),
  //         ),
  //       );
  //     });
}
