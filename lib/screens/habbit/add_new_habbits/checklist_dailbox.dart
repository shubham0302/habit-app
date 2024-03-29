// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void HabbitChecklistCustomDialogBox(BuildContext context) {
  AddHabbitSelectController addHabbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  ThemeData color = Theme.of(context);

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
                                  addHabbitSelectController.addcheckbox.value =
                                      addHabbitSelectController
                                              .addcheckbox.value +
                                          1;
                                  print(addHabbitSelectController
                                      .addcheckbox.value);
                                },
                                child: LabelText(text: "ADD ITEM".tr))
                          ],
                        ),
                        SH.medium(),
                        Expanded(
                          child: Obx(
                            () => ListView.separated(
                              itemCount:
                                  addHabbitSelectController.addcheckbox.value,
                              separatorBuilder: (context, index) => SH.small(),
                              itemBuilder: (context, index) {
                                return Row(children: [
                                  Expanded(
                                      child:
                                          InputField(hintText: "item name".tr)),
                                  SW.medium(),
                                  SW.medium(),
                                  SW.medium(),
                                  GestureDetector(
                                    onTap: () {
                                      if (addHabbitSelectController
                                              .addcheckbox.value >
                                          1) {
                                        addHabbitSelectController.addcheckbox
                                            .value = addHabbitSelectController
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
                            MainLabelText(text: "BACK".tr),
                            GestureDetector(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {},
                                child: MainLabelText(
                                  text: "ADD".tr,
                                  isColor: true,
                                ),
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
  //   return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Container(
  //       width: 360,
  //       height: 480,
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Center(
  //               child: LabelText(
  //                 text: "Define your habit".tr,
  //                 isColor: true,
  //               ),
  //             ),
  //             SH.large(),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 LabelText(text: "Checklist".tr),
  //                 GestureDetector(
  //                     onTap: () {
  //                       addHabbitSelectController.addcheckbox.value =
  //                           addHabbitSelectController.addcheckbox.value + 1;
  //                       print(addHabbitSelectController.addcheckbox.value);
  //                     },
  //                     child: LabelText(text: "ADD ITEM".tr))
  //               ],
  //             ),
  //             SH.medium(),
  //             Expanded(
  //               child: Obx(
  //                 () => ListView.separated(
  //                   itemCount: addHabbitSelectController.addcheckbox.value,
  //                   separatorBuilder: (context, index) => SH.small(),
  //                   itemBuilder: (context, index) {
  //                     return Row(children: [
  //                       Expanded(
  //                           child: InputField(hintText: "item name".tr)),
  //                       SW.medium(),
  //                       SW.medium(),
  //                       SW.medium(),
  //                       GestureDetector(
  //                         onTap: () {
  //                           if (addHabbitSelectController
  //                                   .addcheckbox.value >
  //                               1) {
  //                             addHabbitSelectController.addcheckbox.value =
  //                                 addHabbitSelectController
  //                                         .addcheckbox.value -
  //                                     1;
  //                           }
  //                           // addHabbitSelectController
  //                           //             .addcheckbox.value >
  //                           //         1
  //                           //     ? addHabbitSelectController
  //                           //             .addcheckbox.value -
  //                           //         1
  //                           //     : ;
  //                         },
  //                         child: Icon(
  //                           Icons.delete,
  //                           size: 25,
  //                           color: color.disabledColor,
  //                         ),
  //                       )
  //                     ]);
  //                   },
  //                 ),
  //               ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 MainLabelText(text: "BACK".tr),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: MainLabelText(
  //                     text: "ADD".tr,
  //                     isColor: true,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ]),
  //     ),
  //   );
  // });
}
