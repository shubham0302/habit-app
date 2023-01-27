import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/search_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/home_screen.dart';
import 'package:habbit_app/screens/task_screen/home_edit_task_dailog.dart';
import 'package:habbit_app/widgets/sized_box.dart';

import '../controllers/db_controller.dart';
import '../widgets/text_widget/label_text.dart';
import 'habbit/home_edit_habit_dailogbox.dart';

class FirstHabitScreen extends StatelessWidget {
  const FirstHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController searchController =
        Get.put(SearchController(), permanent: false);
    AddHabbitSelectController habbitSelectController =
        Get.put(AddHabbitSelectController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    ThemeData color = Theme.of(context);
    return Column(
      children: [
        habbitSelectController.tasks.isEmpty ? Container() : SH.large(),
        habbitSelectController.tasks.isEmpty
            ? Container()
            : LabelText(
                text: 'All habits'.tr,
                isBold: true,
                isColor: true,
                color: color.primaryColor,
              ),
        habbitSelectController.tasks.isEmpty ? Container() : SH.medium(),
        habbitSelectController.tasks.isEmpty
            ? Container()
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 
                habbitSelectController.tasks.length,
                separatorBuilder: (context, index) => SH.medium(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // habbitSelectController.habitStatus.value == ''
                      //     ? habbitSelectController.habitStatus.value =
                      //         'incomplete'
                      //     : habbitSelectController.habitStatus.value ==
                      //             'incomplete'
                      //         ? habbitSelectController.habitStatus.value =
                      //             'pending'
                      //         : habbitSelectController.habitStatus.value ==
                      //                 'pending'
                      //             ? habbitSelectController.habitStatus.value =
                      //                 'complete'
                      //             : habbitSelectController.habitStatus.value ==
                      //                     'complete'
                      //                 ? habbitSelectController
                      //                     .habitStatus.value = 'incomplete'
                      //                 : habbitSelectController
                      //                     .habitStatus.value = '';
                      // print(habbitSelectController.habitStatus.value);
                      habitHomeEditCustomDialogBox(context, index);
                      print(habbitSelectController.goal);
                    },
                    child: Obx(
                      () => HomeCard(
                        icon: categoryController.icon[categoryController
                            .categories
                            .firstWhere((element) =>
                                element.id ==
                                habbitSelectController.tasks[index].categoryId)
                            .icon],
                        cardColor: color.brightness == Brightness.dark
                            ? categoryController.iconColor[categoryController
                                .categories
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
                        name: habbitSelectController.tasks[index].habitName,
                        status: habbitSelectController.habitStatus.value ==
                                'incomplete'
                            ? Icons.cancel_outlined
                            : habbitSelectController.habitStatus.value ==
                                    'pending'
                                ? Icons.cancel_outlined
                                : habbitSelectController.habitStatus.value ==
                                        'complete'
                                    ? Icons.cancel_outlined
                                    : Icons.pending_outlined,
                        statusColor: habbitSelectController.habitStatus.value ==
                                'incomplete'
                            ? Colors.redAccent
                            : habbitSelectController.habitStatus.value ==
                                    'pending'
                                ? Colors.yellow
                                : habbitSelectController.habitStatus.value ==
                                        'complete'
                                    ? Colors.green
                                    : color.backgroundColor,
                      ),
                    ),
                  );
                },
              ),
        // recurringTaskController.tasks.isEmpty
        //     ? Container()
        //     : SH.large(),
        // recurringTaskController.tasks.isEmpty
        //     ? Container()
        //     : LabelText(
        //         text: 'All recurring tasks'.tr,
        //         isBold: true,
        //         isColor: true,
        //         color: color.primaryColor,
        //       ),
        // recurringTaskController.tasks.isEmpty
        //     ? Container()
        //     : SH.medium(),
        // recurringTaskController.tasks.isEmpty
        //     ? Container()
        //     : ListView.separated(
        //         physics:
        //             const NeverScrollableScrollPhysics(),
        //         shrinkWrap: true,
        //         itemCount: recurringTaskController
        //             .tasks.length,
        //         separatorBuilder: (context, index) =>
        //             SH.medium(),
        //         itemBuilder: (context, index) {
        //           return HomeCard(
        //             icon: categoryController.icon[
        //                 categoryController.categories
        //                     .firstWhere((element) =>
        //                         element.id ==
        //                         recurringTaskController
        //                             .tasks[index]
        //                             .categoryId)
        //                     .icon],
        //             cardColor: color.brightness ==
        //                     Brightness.dark
        //                 ? categoryController.iconColor[
        //                     categoryController
        //                         .categories
        //                         .firstWhere((element) =>
        //                             element.id ==
        //                             recurringTaskController
        //                                 .tasks[index]
        //                                 .categoryId)
        //                         .color]
        //                 : categoryController
        //                         .iconLightColor[
        //                     categoryController
        //                         .categories
        //                         .firstWhere((element) =>
        //                             element.id ==
        //                             recurringTaskController
        //                                 .tasks[index]
        //                                 .categoryId)
        //                         .color],
        //             name: recurringTaskController
        //                 .tasks[index].rTaskName,
        //             status: Icons.ac_unit_rounded,
        //             statusColor: Colors.green,
        //           );
        //         },
        //       ),
      ],
    );
  }
}

class FirstTaskScreen extends StatelessWidget {
  const FirstTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DBController dbController = Get.put(DBController(), permanent: false);
    AddTaskController taskController =
        Get.put(AddTaskController(), permanent: false);
    AddRecurringTaskController recurringTaskController =
        Get.put(AddRecurringTaskController(), permanent: false);
    AddHabbitSelectController habbitSelectController =
        Get.put(AddHabbitSelectController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    ThemeController themeController = Get.find<ThemeController>();

    ThemeData color = Theme.of(context);
    return Column(
      children: [
        taskController.tasks.isEmpty ? Container() : SH.large(),
        taskController.tasks.isEmpty
            ? Container()
            : LabelText(
                text: 'All tasks'.tr,
                isBold: true,
                isColor: true,
                color: color.primaryColor,
              ),
        taskController.tasks.isEmpty ? Container() : SH.medium(),
        taskController.tasks.isEmpty
            ? Container()
            : AnimationLimiter(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: taskController.tasks.length,
                  separatorBuilder: (context, index) => SH.medium(),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              taskHomeEditCustomDialogBox(context, index);
                            },
                            child: HomeCard(
                              icon: categoryController.icon[categoryController
                                  .categories
                                  .firstWhere((element) =>
                                      element.id ==
                                      taskController.tasks[index].categoryId)
                                  .icon],
                              cardColor: color.brightness == Brightness.dark
                                  ? categoryController.iconColor[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              taskController
                                                  .tasks[index].categoryId)
                                          .color]
                                  : categoryController.iconLightColor[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              taskController
                                                  .tasks[index].categoryId)
                                          .color],
                              name: taskController.tasks[index].taskName,
                              status: Icons.ac_unit,
                              statusColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}

class FirstRecurringScreen extends StatelessWidget {
  const FirstRecurringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DBController dbController = Get.put(DBController(), permanent: false);
    AddTaskController taskController =
        Get.put(AddTaskController(), permanent: false);
    AddRecurringTaskController recurringTaskController =
        Get.put(AddRecurringTaskController(), permanent: false);
    AddHabbitSelectController habbitSelectController =
        Get.put(AddHabbitSelectController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    ThemeController themeController = Get.find<ThemeController>();

    ThemeData color = Theme.of(context);
    return Column(
      children: [
        recurringTaskController.tasks.isEmpty ? Container() : SH.large(),
        recurringTaskController.tasks.isEmpty
            ? Container()
            : LabelText(
                text: 'All recurring tasks'.tr,
                isBold: true,
                isColor: true,
                color: color.primaryColor,
              ),
        recurringTaskController.tasks.isEmpty ? Container() : SH.medium(),
        recurringTaskController.tasks.isEmpty
            ? Container()
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recurringTaskController.tasks.length,
                separatorBuilder: (context, index) => SH.medium(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      taskHomeEditCustomDialogBox(context, index);
                    },
                    child: HomeCard(
                      icon: categoryController.icon[categoryController
                          .categories
                          .firstWhere((element) =>
                              element.id ==
                              recurringTaskController.tasks[index].categoryId)
                          .icon],
                      cardColor: color.brightness == Brightness.dark
                          ? categoryController.iconColor[categoryController
                              .categories
                              .firstWhere((element) =>
                                  element.id ==
                                  recurringTaskController
                                      .tasks[index].categoryId)
                              .color]
                          : categoryController.iconLightColor[categoryController
                              .categories
                              .firstWhere((element) =>
                                  element.id ==
                                  recurringTaskController
                                      .tasks[index].categoryId)
                              .color],
                      name: recurringTaskController.tasks[index].rTaskName,
                      status: Icons.ac_unit_rounded,
                      statusColor: Colors.green,
                    ),
                  );
                },
              ),
      ],
    );
  }
}
