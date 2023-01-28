// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/screens/contactUS/contactsupport_dailog.dart';
import 'package:habbit_app/screens/contactUS/reminder_dailbox.dart';
import 'package:habbit_app/screens/contactUS/report_dailog.dart';
import 'package:habbit_app/screens/contactUS/sendsuggestion_dailbox.dart';
import 'package:habbit_app/widgets/icon_widget.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void habitHomeEditCustomDialogBox(BuildContext context, int index) {
  ThemeData color = Theme.of(context);

  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (
        BuildContext context,
        a1,
        a2,
        widget,
      ) {
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
                  width: 280,
                  // height: 290,
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
                                  height: 35,
                                  width: 3,
                                  color: categoryController.iconColor[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              habbitSelectController
                                                  .tasks[index].categoryId)
                                          .color],
                                ),
                                SW.small(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                      text: habbitSelectController
                                          .tasks[index].habitName,
                                    ),
                                    SH.small(),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 2, bottom: 2, left: 4, right: 4),
                                      decoration: BoxDecoration(
                                          color: categoryController.iconColor[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          habbitSelectController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .color]
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: DescriptionText(
                                        text: habbitSelectController
                                            .repetitionsData
                                            .firstWhere((element) =>
                                                element.id ==
                                                habbitSelectController
                                                    .tasks[index].repetitonId)
                                            .type,
                                        isColor: true,
                                        color: categoryController.iconColor[
                                            categoryController.categories
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    habbitSelectController
                                                        .tasks[index]
                                                        .categoryId)
                                                .color],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Obx(() => IconWidgetClassic(
                                  icon: categoryController.icon[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              habbitSelectController
                                                  .tasks[index].categoryId)
                                          .icon],
                                  contanerColor: color.brightness ==
                                          Brightness.dark
                                      ? categoryController.iconColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  habbitSelectController
                                                      .tasks[index].categoryId)
                                              .color]
                                      : categoryController.iconLightColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  habbitSelectController
                                                      .tasks[index].categoryId)
                                              .color],
                                ))
                          ],
                        ),
                        SH.small(),
                        Divider(),
                        SH.small(),
                        habbitSelectController.tasks[index].evaluate == 'Timer'
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 35,
                                      child: Row(children: [
                                        Icon(
                                          Icons.track_changes_sharp,
                                          size: 25,
                                          color: color.disabledColor,
                                        ),
                                        SW.small(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DescriptionText(text: 'Goal'),
                                            SH.small(),
                                            LabelText(
                                                text:
                                                    "${habbitSelectController.timerDropDownValue} ${habbitSelectController.currentvalueHour}:${habbitSelectController.currentvalueMin}:${habbitSelectController.currentvalueSec}")
                                          ],
                                        )
                                      ]),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(children: [
                                      DescriptionText(text: 'Current'),
                                      SH.small(),
                                      LabelText(text: '00:00')
                                    ]),
                                  ))
                                ],
                              )
                            : habbitSelectController.tasks[index].evaluate ==
                                    'Numeric'
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 35,
                                          child: Row(children: [
                                            Icon(
                                              Icons.track_changes_sharp,
                                              size: 25,
                                              color: color.disabledColor,
                                            ),
                                            SW.small(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DescriptionText(text: 'Goal'),
                                                SH.small(),
                                                LabelText(
                                                    text:
                                                        '${habbitSelectController.numericDropDownValue.value} ${habbitSelectController.updateGoal} ${habbitSelectController.updateUnit}')
                                              ],
                                            )
                                          ]),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Column(children: [
                                          DescriptionText(text: 'Current'),
                                          SH.small(),
                                          LabelText(
                                              text:
                                                  'o ${habbitSelectController.updateUnit}')
                                        ]),
                                      ))
                                    ],
                                  )
                                : habbitSelectController
                                            .tasks[index].evaluate ==
                                        'YES OR NO'
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 50,
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        habbitSelectController
                                                            .habitStatus
                                                            .value = 'pending';
                                                      },
                                                      behavior: HitTestBehavior
                                                          .translucent,
                                                      child: Obx(
                                                        () => Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: habbitSelectController
                                                                          .habitStatus
                                                                          .value ==
                                                                      'pending'
                                                                  ? Colors
                                                                      .yellow
                                                                      .shade200
                                                                  : color
                                                                      .bottomAppBarColor),
                                                          child: Icon(
                                                            Icons
                                                                .pending_outlined,
                                                            size: 20,
                                                            color: habbitSelectController
                                                                        .habitStatus
                                                                        .value ==
                                                                    'pending'
                                                                ? Colors.black
                                                                : color
                                                                    .disabledColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SH.small(),
                                                    LabelText(text: 'Pending')
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                habbitSelectController
                                                    .habitStatus.value = 'done';
                                              },
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              child: Container(
                                                  height: 50,
                                                  child: Column(
                                                    children: [
                                                      Obx(
                                                        () => Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: habbitSelectController
                                                                          .habitStatus
                                                                          .value ==
                                                                      'done'
                                                                  ? Colors.green
                                                                      .shade200
                                                                  : color
                                                                      .bottomAppBarColor),
                                                          child: Icon(
                                                            Icons.done,
                                                            size: 20,
                                                            color: habbitSelectController
                                                                        .habitStatus
                                                                        .value ==
                                                                    'done'
                                                                ? Colors.green
                                                                : color
                                                                    .disabledColor,
                                                          ),
                                                        ),
                                                      ),
                                                      SH.small(),
                                                      LabelText(
                                                        text: 'Done',
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                habbitSelectController
                                                    .habitStatus.value = 'fail';
                                              },
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              child: Container(
                                                  height: 50,
                                                  child: Column(
                                                    children: [
                                                      Obx(
                                                        () => Container(
                                                            height: 25,
                                                            width: 25,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: habbitSelectController.habitStatus.value ==
                                                                        'fail'
                                                                    ? Colors.red
                                                                        .shade200
                                                                    : color
                                                                        .bottomAppBarColor),
                                                            child: Icon(
                                                              Icons
                                                                  .cancel_outlined,
                                                              size: 20,
                                                              color: habbitSelectController
                                                                          .habitStatus
                                                                          .value ==
                                                                      'fail'
                                                                  ? Colors.red
                                                                  : color
                                                                      .disabledColor,
                                                            )),
                                                      ),
                                                      SH.small(),
                                                      LabelText(text: 'Fail')
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                    : habbitSelectController
                                                .tasks[index].evaluate ==
                                            'Checklist'
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.checklist,
                                                size: 25,
                                                color: color.disabledColor,
                                              ),
                                              SW.small(),
                                              LabelText(text: 'Checklist')
                                            ],
                                          )
                                        : SizedBox(),
                        SH.small(),
                        Divider(),
                        SH.small(),
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_off_outlined,
                              size: 25,
                              color: color.disabledColor,
                            ),
                            SW.small(),
                            LabelText(text: 'Add reminder...')
                          ],
                        ),
                        SH.small(),
                        Divider(),
                        SH.small(),
                        Row(
                          children: [
                            Icon(
                              Icons.message,
                              size: 25,
                              color: color.disabledColor,
                            ),
                            SW.small(),
                            LabelText(text: 'Add note....')
                          ],
                        ),
                        SH.small(),
                        Divider(),
                        SH.small(),
                        Row(
                          children: [
                            Icon(
                              Icons.repeat,
                              size: 25,
                              color: color.disabledColor,
                            ),
                            SW.small(),
                            LabelText(text: 'Reset entry')
                          ],
                        ),
                        SH.small(),
                        Divider(),
                        SH.small(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: MainLabelText(
                            text: 'CLOSE'.tr,
                            isColor: true,
                            color: categoryController.iconColor[
                                categoryController.categories
                                    .firstWhere((element) =>
                                        element.id ==
                                        habbitSelectController
                                            .tasks[index].categoryId)
                                    .color],
                          ),
                        )
                      ]),
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
