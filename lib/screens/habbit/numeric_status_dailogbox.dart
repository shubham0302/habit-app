// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text_large.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';
import 'package:lottie/lottie.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void NumericStatusCustomDialogBox(BuildContext context, int index, DateTime day,
    String status, int statusId) {
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
                        Center(
                          child: LabelText(
                            text: "Enter Value".tr,
                            isColor: true,
                          ),
                        ),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: color.primaryColor),
                              child: Row(children: [
                                SW.small(),
                                GestureDetector(
                                  onTap: () {
                                    habbitSelectController.subNumaric();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: color.backgroundColor,
                                  ),
                                ),
                                SW.small(),
                                Expanded(
                                    child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  color: color.backgroundColor.withOpacity(0.4),
                                  child: Center(
                                      child: Obx(
                                    () => LabelTextLarge(
                                      text: habbitSelectController
                                          .numaricStatus.value
                                          .toString(),
                                    ),
                                  )),
                                )),
                                SW.small(),
                                GestureDetector(
                                  onTap: () {
                                    habbitSelectController.addNumaric();
                                    print(habbitSelectController
                                        .numaricStatus.value);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                    color: color.backgroundColor,
                                  ),
                                ),
                                SW.small(),
                              ]),
                            )
                          ],
                        ),
                        SH.medium(),
                        const DescriptionText(text: 'Daily goal'),
                        LabelText(
                            text:
                                '${habbitSelectController.tasks[index].habitSucessType} ${habbitSelectController.tasks[index].habitSucess} ${habbitSelectController.tasks[index].habitSucessUnit}'),
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
                                  behavior: HitTestBehavior.translucent,
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
                                  behavior: HitTestBehavior.translucent,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        print('ok');

                                        status == 'e'
                                            ? habbitSelectController.addStatus(
                                                habbitSelectController.tasks
                                                    .where((p0) =>
                                                        p0.archive == false)
                                                    .toList()[index]
                                                    .habbitId,
                                                'initial',
                                                day,
                                                0,
                                                habbitSelectController
                                                    .numaricStatus.value
                                                    .toString(),
                                                habbitSelectController.tasks
                                                    .where((p0) =>
                                                        p0.archive == false)
                                                    .toList()[index]
                                                    .evaluate,
                                                'initial')
                                            : habbitSelectController.addStatus(
                                                habbitSelectController.tasks
                                                    .where((p0) =>
                                                        p0.archive == false)
                                                    .toList()[index]
                                                    .habbitId,
                                                status,
                                                day,
                                                statusId,
                                                habbitSelectController
                                                    .numaricStatus.value
                                                    .toString(),
                                                habbitSelectController.tasks
                                                    .where((p0) =>
                                                        p0.archive == false)
                                                    .toList()[index]
                                                    .evaluate,
                                                habbitSelectController
                                                            .numaricStatus
                                                            .value >=
                                                        int.parse(
                                                            habbitSelectController
                                                                .tasks[index]
                                                                .habitSucess
                                                                .toString())
                                                    ? 'success'
                                                    : 'initial');
                                        print(habbitSelectController
                                                .numaricStatus.value >=
                                            int.parse(habbitSelectController
                                                .tasks[index].habitSucess
                                                .toString()));
                                        Get.back();
                                      },
                                      child: Container(
                                          child:
                                              DescriptionText(text: 'OK'.tr)),
                                    ),
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
