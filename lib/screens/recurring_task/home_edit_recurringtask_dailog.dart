// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/widgets/icon_widget.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void recurringTaskHomeEditCustomDialogBox(BuildContext context, int index) {
  ThemeData color = Theme.of(context);

  AddRecurringTaskController recurringTaskController =
      Get.put(AddRecurringTaskController(), permanent: false);
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
                                              recurringTaskController
                                                  .tasks[index].categoryId)
                                          .color],
                                ),
                                SW.small(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                      text: recurringTaskController
                                          .tasks[index].rTaskName,
                                    ),
                                    SH.small(),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 2, bottom: 2, left: 4, right: 4),
                                      decoration: BoxDecoration(
                                          color: categoryController
                                              .iconColor[categoryController
                                                  .categories
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      recurringTaskController
                                                          .tasks[index]
                                                          .categoryId)
                                                  .color]
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: DescriptionText(
                                        text: recurringTaskController.repeatTime
                                            .toString(),
                                        isColor: true,
                                        color: categoryController.iconColor[
                                            categoryController.categories
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    recurringTaskController
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
                                              recurringTaskController
                                                  .tasks[index].categoryId)
                                          .icon],
                                  contanerColor: color.brightness ==
                                          Brightness.dark
                                      ? categoryController.iconColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  recurringTaskController
                                                      .tasks[index].categoryId)
                                              .color]
                                      : categoryController.iconLightColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  recurringTaskController
                                                      .tasks[index].categoryId)
                                              .color],
                                ))
                          ],
                        ),
                        SH.small(),
                        Divider(),
                        SH.small(),
                        recurringTaskController.tasks[index].evaluate ==
                                'YES OR NO'
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 50,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      color.bottomAppBarColor),
                                            ),
                                            SH.small(),
                                            LabelText(text: 'Pending')
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 50,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      color.bottomAppBarColor),
                                              child: Icon(
                                                Icons.done,
                                                size: 20,
                                                color: color.disabledColor,
                                              ),
                                            ),
                                            SH.small(),
                                            LabelText(text: 'Done')
                                          ],
                                        )),
                                  ),
                                ],
                              )
                            : recurringTaskController.tasks[index].evaluate ==
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
                                        recurringTaskController
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
