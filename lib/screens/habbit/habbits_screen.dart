// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/priority_custom_dilogbox.dart';
import 'package:habbit_app/screens/habbit/datechip.dart';
import 'package:habbit_app/screens/habbit/habbit_compite_dailbox.dart';
import 'package:habbit_app/widgets/icon_widget.dart';

import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text_large.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text_large.dart';
import 'package:intl/intl.dart';

class HabbitsScreen extends StatelessWidget {
  const HabbitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController = Get.put(SwitchController());
    TimerTabController tabController =
        Get.put(TimerTabController(), permanent: false);
    AddHabbitSelectController habbitSelectController =
        Get.put(AddHabbitSelectController());
    CategoryController categoryController = Get.put(CategoryController());
    ThemeData color = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addhabbit");
        },
        backgroundColor: color.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => habbitSelectController.tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          height: 150,
                          width: 250,
                          image: AssetImage('assets/images/tasks.png'),
                        ),
                        SH.large(),
                        LabelText(
                          text: 'There are no active habits'.tr,
                          isBold: true,
                        ),
                        SH.small(),
                        DescriptionText(
                          text: 'Add new habit for a fresh start!'.tr,
                          // isBold: true,
                        ),
                      ],
                    ),
                  )
                : AnimationLimiter(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // HabbitCompleteTaskCustomDialogBox(context, index);
                            Get.toNamed('/habbit-detail');
                          },
                          child: AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Column(children: [
                                  Slidable(
                                    key: const ValueKey(1),
                                    startActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          autoClose: true,
                                          onPressed: (context) {
                                            PriorityCustomDialogBox(context);
                                          },
                                          backgroundColor: color.brightness ==
                                                  Brightness.dark
                                              ? categoryController.iconColor[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          habbitSelectController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .color]
                                              : categoryController
                                                      .iconLightColor[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          habbitSelectController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .color],
                                          foregroundColor: color.hintColor,
                                          icon: Icons.flag_outlined,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20)),
                                        ),
                                      ],
                                    ),
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          flex: 2,
                                          onPressed: (context) {
                                            Get.toNamed('/habbit-detail');
                                            tabController.tabIndex.value = 2;
                                          },
                                          backgroundColor: color.brightness ==
                                                  Brightness.dark
                                              ? categoryController.iconColor[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          habbitSelectController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .color]
                                              : categoryController
                                                      .iconLightColor[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          habbitSelectController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .color],
                                          foregroundColor: color.hintColor,
                                          icon: Icons.edit,
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      // height: 210,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: color.disabledColor
                                              .withOpacity(0.1)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: color.brightness ==
                                                                Brightness.dark
                                                            ? categoryController.iconColor[categoryController
                                                                .categories
                                                                .firstWhere((element) =>
                                                                    element.id ==
                                                                    habbitSelectController
                                                                        .tasks[
                                                                            index]
                                                                        .categoryId)
                                                                .color]
                                                            : categoryController
                                                                    .iconLightColor[
                                                                categoryController
                                                                    .categories
                                                                    .firstWhere((element) =>
                                                                        element.id == habbitSelectController.tasks[index].categoryId)
                                                                    .color]),
                                                  ),
                                                  SW.medium(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Obx(
                                                        () => switchController
                                                                    .textSizing
                                                                    .value ==
                                                                'Default'
                                                            ? LabelText(
                                                                text: habbitSelectController
                                                                    .tasks[
                                                                        index]
                                                                    .habitName,
                                                                isBold: true,
                                                              )
                                                            : LabelTextLarge(
                                                                text: habbitSelectController
                                                                    .tasks[
                                                                        index]
                                                                    .habitName,
                                                                // isBold: true,
                                                              ),
                                                      ),
                                                      SH.small(),
                                                      Row(
                                                        children: [
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 3,
                                                                      bottom: 3,
                                                                      left: 5,
                                                                      right: 5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        //categoryController.iconColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                                                        color.brightness == Brightness.dark ? categoryController.iconColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color] : categoryController.iconLightColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                                                    width: 2),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            5)),
                                                                color:
                                                                    //  categoryController.iconColor[categoryController
                                                                    //     .categories
                                                                    //     .firstWhere((element) =>
                                                                    //         element
                                                                    //             .id ==
                                                                    //         habbitSelectController
                                                                    //             .tasks[index]
                                                                    //             .categoryId)
                                                                    //     .color],
                                                                    color.brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? categoryController.iconColor[categoryController
                                                                            .categories
                                                                            .firstWhere((element) =>
                                                                                element.id ==
                                                                                habbitSelectController.tasks[index].categoryId)
                                                                            .color]
                                                                        : categoryController.iconLightColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                                              ),
                                                              child: switchController
                                                                          .textSizing
                                                                          .value ==
                                                                      'Default'
                                                                  ? DescriptionText(
                                                                      text: habbitSelectController
                                                                          .repetitionsData
                                                                          .firstWhere((element) =>
                                                                              element.id ==
                                                                              habbitSelectController.tasks[index].repetitonId)
                                                                          .type,
                                                                      isBold:
                                                                          true,
                                                                      isColor:
                                                                          true,
                                                                      color: color
                                                                          .backgroundColor,
                                                                    )
                                                                  : DescriptionTextLarge(
                                                                      text: habbitSelectController
                                                                          .repetitionsData
                                                                          .firstWhere((element) =>
                                                                              element.id ==
                                                                              habbitSelectController.tasks[index].repetitonId)
                                                                          .type,
                                                                      isBold:
                                                                          true,
                                                                      isColor:
                                                                          true,
                                                                      color: color
                                                                          .backgroundColor,
                                                                    )),
                                                          SW.small(),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 3,
                                                                    bottom: 3,
                                                                    left: 5,
                                                                    right: 5),
                                                            decoration: BoxDecoration(
                                                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                                color: Colors.transparent,
                                                                border: Border.all(
                                                                    color:
                                                                        // categoryController.iconColor[categoryController
                                                                        //     .categories
                                                                        //     .firstWhere((element) =>
                                                                        //         element.id ==
                                                                        //         habbitSelectController.tasks[index].categoryId)
                                                                        //     .color],
                                                                        color.brightness == Brightness.dark ? categoryController.iconColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color] : categoryController.iconLightColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                                                    width: 2)),
                                                            child: Row(
                                                              children: [
                                                                DescriptionText(
                                                                  text: habbitSelectController
                                                                      .tasks[
                                                                          index]
                                                                      .priority
                                                                      .toString(),
                                                                  isColor: true,
                                                                  color:
                                                                      // categoryController.iconColor[categoryController
                                                                      //     .categories
                                                                      //     .firstWhere((element) =>
                                                                      //         element
                                                                      //             .id ==
                                                                      //         habbitSelectController
                                                                      //             .tasks[index]
                                                                      //             .categoryId)
                                                                      //     .color]
                                                                      color.brightness ==
                                                                              Brightness
                                                                                  .dark
                                                                          ? categoryController.iconColor[categoryController
                                                                              .categories
                                                                              .firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId)
                                                                              .color]
                                                                          : categoryController.iconLightColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .flag_outlined,
                                                                  color:
                                                                      // categoryController.iconColor[categoryController
                                                                      //     .categories
                                                                      //     .firstWhere((element) =>
                                                                      //         element
                                                                      //             .id ==
                                                                      //         habbitSelectController
                                                                      //             .tasks[index]
                                                                      //             .categoryId)
                                                                      //     .color]
                                                                      color.brightness ==
                                                                              Brightness
                                                                                  .dark
                                                                          ? categoryController.iconColor[categoryController
                                                                              .categories
                                                                              .firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId)
                                                                              .color]
                                                                          : categoryController.iconLightColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              // Container(
                                              //     height: 35,
                                              //     width: 35,
                                              //     decoration: BoxDecoration(
                                              //       borderRadius:
                                              //           BorderRadius.circular(8),
                                              //       color: categoryController
                                              //           .iconColor[categoryController
                                              //               .categories
                                              //               .firstWhere((element) =>
                                              //                   element.id ==
                                              //                   habbitSelectController
                                              //                       .tasks[index]
                                              //                       .categoryId)
                                              //               .color]
                                              //           .withOpacity(.3),
                                              //     ),
                                              //     child:
                                              //         // Icon(
                                              //         //   Icons.brush,
                                              //         //   size: 23,
                                              //         //   color: categoryController.iconColor[
                                              //         //       categoryController.categories
                                              //         //           .firstWhere((element) =>
                                              //         //               element.id ==
                                              //         //               habbitSelectController
                                              //         //                   .tasks[index]
                                              //         //                   .categoryId)
                                              //         //           .color],
                                              //         // ),
                                              // ),
                                              Obx(() => IconWidgetClassic(
                                                    icon: categoryController
                                                            .icon[
                                                        categoryController
                                                            .categories
                                                            .firstWhere((element) =>
                                                                element.id ==
                                                                habbitSelectController
                                                                    .tasks[
                                                                        index]
                                                                    .categoryId)
                                                            .icon],
                                                    contanerColor: color.brightness ==
                                                            Brightness.dark
                                                        ? categoryController.iconColor[categoryController
                                                            .categories
                                                            .firstWhere((element) =>
                                                                element.id ==
                                                                habbitSelectController
                                                                    .tasks[
                                                                        index]
                                                                    .categoryId)
                                                            .color]
                                                        : categoryController
                                                                .iconLightColor[
                                                            categoryController.categories
                                                                .firstWhere((element) =>
                                                                    element.id ==
                                                                    habbitSelectController
                                                                        .tasks[index]
                                                                        .categoryId)
                                                                .color],
                                                  ))
                                            ],
                                          ),
                                          SH.large(),
                                          Obx(() =>
                                              //  switchController
                                              //             .CollapseSwichChange.value ==
                                              //         true
                                              //     ?
                                              switchController.isOpen.value ==
                                                          true ||
                                                      switchController
                                                              .CollapseSwichChange
                                                              .value ==
                                                          false
                                                  ? Container(
                                                      child:
                                                          //  habbitSelectController
                                                          //         .openHabbits
                                                          //         .contains(habbitSelectController
                                                          //             .tasks[index].habbitId)
                                                          //     ?
                                                          Row(
                                                      children: [
                                                        DateChip(
                                                          day: DateFormat(
                                                                  'EEEE')
                                                              .format(DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                      .month,
                                                                  DateTime.now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              -6))
                                                                      .day
                                                                  // DateTime.now()
                                                                  //     .add(Duration(days: index))
                                                                  //     .weekday

                                                                  ))
                                                              .toString()
                                                              .substring(0, 3),
                                                          date: (DateTime.now()
                                                                  .add(const Duration(
                                                                      days: -6))
                                                                  .day)
                                                              .toString(),
                                                          isColor: true,
                                                          selectColor:
                                                              Colors.red,
                                                          op: () {},
                                                        ),
                                                        SW.small(),
                                                        DateChip(
                                                          day: DateFormat(
                                                                  'EEEE')
                                                              .format(DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                      .month,
                                                                  DateTime.now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              -5))
                                                                      .day
                                                                  // DateTime.now()
                                                                  //     .add(Duration(days: index))
                                                                  //     .weekday

                                                                  ))
                                                              .toString()
                                                              .substring(0, 3),
                                                          date: (DateTime.now()
                                                                  .add(const Duration(
                                                                      days: -5))
                                                                  .day)
                                                              .toString(),
                                                          isColor: true,
                                                          selectColor:
                                                              Colors.red,
                                                          op: () {},
                                                        ),
                                                        SW.small(),
                                                        DateChip(
                                                          day: DateFormat(
                                                                  'EEEE')
                                                              .format(DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                      .month,
                                                                  DateTime.now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              -4))
                                                                      .day
                                                                  // DateTime.now()
                                                                  //     .add(Duration(days: index))
                                                                  //     .weekday

                                                                  ))
                                                              .toString()
                                                              .substring(0, 3),
                                                          date: (DateTime.now()
                                                                  .add(const Duration(
                                                                      days: -4))
                                                                  .day)
                                                              .toString(),
                                                          isColor: true,
                                                          selectColor:
                                                              Colors.yellow,
                                                          op: () {},
                                                        ),
                                                        SW.small(),
                                                        DateChip(
                                                          day: DateFormat(
                                                                  'EEEE')
                                                              .format(DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                      .month,
                                                                  DateTime.now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              -3))
                                                                      .day
                                                                  // DateTime.now()
                                                                  //     .add(Duration(days: index))
                                                                  //     .weekday

                                                                  ))
                                                              .toString()
                                                              .substring(0, 3),
                                                          date: (DateTime.now()
                                                                  .add(const Duration(
                                                                      days: -3))
                                                                  .day)
                                                              .toString(),
                                                          op: () {},
                                                        ),
                                                        SW.small(),
                                                        DateChip(
                                                          day: DateFormat(
                                                                  'EEEE')
                                                              .format(DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                      .month,
                                                                  DateTime.now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              -2))
                                                                      .day
                                                                  // DateTime.now()
                                                                  //     .add(Duration(days: index))
                                                                  //     .weekday

                                                                  ))
                                                              .toString()
                                                              .substring(0, 3),
                                                          date: (DateTime.now()
                                                                  .add(const Duration(
                                                                      days: -2))
                                                                  .day)
                                                              .toString(),
                                                          op: () {},
                                                        ),
                                                        SW.small(),
                                                        DateChip(
                                                          day: DateFormat(
                                                                  'EEEE')
                                                              .format(DateTime(
                                                                  DateTime.now()
                                                                      .year,
                                                                  DateTime.now()
                                                                      .month,
                                                                  DateTime.now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              -1))
                                                                      .day
                                                                  // DateTime.now()
                                                                  //     .add(Duration(days: index))
                                                                  //     .weekday

                                                                  ))
                                                              .toString()
                                                              .substring(0, 3),
                                                          date: (DateTime.now()
                                                                  .add(const Duration(
                                                                      days: -1))
                                                                  .day)
                                                              .toString(),
                                                          isColor: true,
                                                          selectColor:
                                                              Colors.red,
                                                          op: () {},
                                                        ),

                                                        SW.small(),
                                                        Obx(
                                                          () => DateChip(
                                                            day: DateFormat(
                                                                    'EEEE')
                                                                .format(DateTime(
                                                                    DateTime.now()
                                                                        .year,
                                                                    DateTime.now()
                                                                        .month,
                                                                    DateTime.now()
                                                                        .day
                                                                    // DateTime.now()
                                                                    //     .add(Duration(days: index))
                                                                    //     .weekday

                                                                    ))
                                                                .toString()
                                                                .substring(
                                                                    0, 3),
                                                            date:
                                                                (DateTime.now()
                                                                        .day)
                                                                    .toString(),
                                                            isColor: true,
                                                            selectColor: habbitSelectController
                                                                        .colorChange
                                                                        .value ==
                                                                    'red'
                                                                ? Colors.red
                                                                : habbitSelectController
                                                                            .colorChange
                                                                            .value ==
                                                                        'yellow'
                                                                    ? Colors
                                                                        .yellow
                                                                    : habbitSelectController.colorChange.value ==
                                                                            'green'
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .white,
                                                            op: () {
                                                              habbitSelectController
                                                                          .colorChange
                                                                          .value ==
                                                                      'yellow'
                                                                  ? HabbitCompleteTaskCustomDialogBox(
                                                                      context,
                                                                      index)
                                                                  : null;
                                                              habbitSelectController
                                                                  .colorChangeTap();
                                                              habbitSelectController
                                                                  .notifiy();
                                                              habbitSelectController
                                                                  .isVibration();
                                                              // habbitSelectController
                                                              //     .colorChange1();
                                                              print(habbitSelectController
                                                                  .colorChange
                                                                  .value);
                                                              // print(
                                                              //     habbitSelectController
                                                              //         .selectColor
                                                              //         .value);
                                                            },
                                                          ),
                                                        ),
                                                        // SW.small(),
                                                      ],
                                                    )
                                                      // : const SizedBox(),
                                                      )
                                                  : const SizedBox()),
                                          SH.large(),
                                          Divider(
                                            height: 2,
                                            thickness: 2,
                                            color: color.backgroundColor,
                                          ),
                                          SH.large(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.insert_link_rounded,
                                                    color:
                                                        // categoryController
                                                        //         .iconColor[
                                                        //     categoryController
                                                        //         .categories
                                                        //         .firstWhere((element) =>
                                                        //             element.id ==
                                                        //             habbitSelectController
                                                        //                 .tasks[
                                                        //                     index]
                                                        //                 .categoryId)
                                                        //         .color]
                                                        color.brightness ==
                                                                Brightness.dark
                                                            ? categoryController
                                                                    .iconColor[
                                                                categoryController
                                                                    .categories
                                                                    .firstWhere((element) =>
                                                                        element.id ==
                                                                        habbitSelectController
                                                                            .tasks[
                                                                                index]
                                                                            .categoryId)
                                                                    .color]
                                                            : categoryController
                                                                    .iconLightColor[
                                                                categoryController
                                                                    .categories
                                                                    .firstWhere((element) =>
                                                                        element
                                                                            .id ==
                                                                        habbitSelectController
                                                                            .tasks[index]
                                                                            .categoryId)
                                                                    .color],
                                                    size: 25,
                                                  ),
                                                  SW.small(),
                                                  DescriptionText(
                                                    isBold: true,
                                                    text: "4",
                                                    isColor: true,
                                                    color: color.disabledColor,
                                                  ),
                                                  SW.medium(),
                                                  Icon(
                                                    Icons.check_circle_outline,
                                                    color:
                                                        // categoryController
                                                        //         .iconColor[
                                                        //     categoryController
                                                        //         .categories
                                                        //         .firstWhere((element) =>
                                                        //             element.id ==
                                                        //             habbitSelectController
                                                        //                 .tasks[
                                                        //                     index]
                                                        //                 .categoryId)
                                                        //         .color]
                                                        color.brightness ==
                                                                Brightness.dark
                                                            ? categoryController
                                                                    .iconColor[
                                                                categoryController
                                                                    .categories
                                                                    .firstWhere((element) =>
                                                                        element.id ==
                                                                        habbitSelectController
                                                                            .tasks[
                                                                                index]
                                                                            .categoryId)
                                                                    .color]
                                                            : categoryController
                                                                    .iconLightColor[
                                                                categoryController
                                                                    .categories
                                                                    .firstWhere((element) =>
                                                                        element
                                                                            .id ==
                                                                        habbitSelectController
                                                                            .tasks[index]
                                                                            .categoryId)
                                                                    .color],
                                                    size: 25,
                                                  ),
                                                  SW.small(),
                                                  DescriptionText(
                                                    isBold: true,
                                                    text: "52%",
                                                    isColor: true,
                                                    color: color.disabledColor,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    color: color.disabledColor,
                                                    size: 25,
                                                  ),
                                                  SW.medium(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          '/habbit-detail');
                                                      tabController
                                                          .tabIndex.value = 1;
                                                    },
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    child: Icon(
                                                      Icons.stacked_bar_chart,
                                                      color:
                                                          color.disabledColor,
                                                      size: 25,
                                                    ),
                                                  ),
                                                  SW.medium(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      switchController.isOpen
                                                                  .value ==
                                                              true
                                                          ? switchController
                                                              .isOpen
                                                              .value = false
                                                          : switchController
                                                              .isOpen
                                                              .value = true;
                                                    },
                                                    child: Obx(() => switchController
                                                                .CollapseSwichChange
                                                                .value ==
                                                            true
                                                        ? switchController
                                                                    .isOpen
                                                                    .value ==
                                                                false
                                                            ? Column(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_up_sharp,
                                                                    color: color
                                                                        .disabledColor,
                                                                    size: 15,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_sharp,
                                                                    color: color
                                                                        .disabledColor,
                                                                    size: 15,
                                                                  ),
                                                                ],
                                                              )
                                                            : Column(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_sharp,
                                                                    color: color
                                                                        .disabledColor,
                                                                    size: 15,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_up_sharp,
                                                                    color: color
                                                                        .disabledColor,
                                                                    size: 15,
                                                                  ),
                                                                ],
                                                              )
                                                        : const SizedBox()),
                                                  ),
                                                  SW.medium(),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.more_vert,
                                                      color:
                                                          color.disabledColor,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: habbitSelectController.tasks.length,
                      separatorBuilder: (context, index) => SH.large(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
