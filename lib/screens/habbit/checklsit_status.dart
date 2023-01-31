// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void ChecklistStatusCustomDialogBox(BuildContext context, int index) {
  AddHabbitSelectController habbitSelectController =
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
                  width: 250,
                  // height: 480,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: color.primaryColor,
                                ),
                                SW.small(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        text: habbitSelectController
                                            .tasks[index].habitName),
                                    DescriptionText(
                                        text: habbitSelectController
                                            .tasks[index].endDate
                                            .toIso8601String())
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.refresh,
                                  size: 25,
                                  color: color.disabledColor,
                                ),
                                SW.medium(),
                                Icon(
                                  Icons.edit_note_outlined,
                                  size: 25,
                                  color: color.disabledColor,
                                ),
                                SW.medium(),
                                Icon(
                                  Icons.list_rounded,
                                  size: 25,
                                  color: color.disabledColor,
                                ),
                              ],
                            )
                          ],
                        ),

                        Container(
                          height: 200,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const LabelText(text: 'NAme of checklist'),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: color.disabledColor),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => SH.large(),
                              itemCount: 10),
                        ),

                        SH.medium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            SW.small(),
                            const MainLabelText(
                              text: 'Add List',
                              isColor: true,
                            )
                          ],
                        ),
                        SH.small(),
                        // LabelText(text: 'Less than 20.0 ${habbitSelectController.tasks[index].}'),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Center(
                                    child: Container(
                                        child:
                                            DescriptionText(text: 'CLOSE'.tr)),
                                  )),
                            ),
                            Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Center(
                                    child: Container(
                                        child: DescriptionText(text: 'OK'.tr)),
                                  )),
                            ),
                          ],
                        )
                      ]),
                ),
              )),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
