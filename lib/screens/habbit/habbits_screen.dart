import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/screens/habbit/datechip.dart';

import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabbitsScreen extends StatelessWidget {
  const HabbitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController = Get.put(SwitchController());
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
            () => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Get.toNamed('/habbit-detail');
                  },
                  child: Column(children: [
                    Container(
                      // height: 210,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: color.disabledColor.withOpacity(0.1)),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        color: categoryController.iconColor[
                                            categoryController.categories
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    habbitSelectController
                                                        .tasks[index]
                                                        .categoryId)
                                                .color]),
                                  ),
                                  SW.medium(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelText(
                                        text: habbitSelectController
                                            .tasks[index].habitName,
                                        isBold: true,
                                      ),
                                      SH.small(),
                                      Row(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 3,
                                                  bottom: 3,
                                                  left: 5,
                                                  right: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: categoryController.iconColor[categoryController
                                                          .categories
                                                          .firstWhere((element) =>
                                                              element.id ==
                                                              habbitSelectController
                                                                  .tasks[index]
                                                                  .categoryId)
                                                          .color],
                                                      width: 2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: categoryController
                                                      .iconColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color]),
                                              child: DescriptionText(
                                                text: habbitSelectController
                                                    .repetitionsData
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        habbitSelectController
                                                            .tasks[index]
                                                            .repetitonId)
                                                    .type,
                                                isBold: true,
                                                isColor: true,
                                                color: color.backgroundColor,
                                              )),
                                          SW.small(),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 3,
                                                bottom: 3,
                                                left: 5,
                                                right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5)),
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: categoryController
                                                            .iconColor[
                                                        categoryController
                                                            .categories
                                                            .firstWhere((element) =>
                                                                element.id ==
                                                                habbitSelectController
                                                                    .tasks[
                                                                        index]
                                                                    .categoryId)
                                                            .color],
                                                    width: 2)),
                                            child: Row(
                                              children: [
                                                DescriptionText(
                                                  text: '2',
                                                  isColor: true,
                                                  color: categoryController
                                                          .iconColor[
                                                      categoryController
                                                          .categories
                                                          .firstWhere((element) =>
                                                              element.id ==
                                                              habbitSelectController
                                                                  .tasks[index]
                                                                  .categoryId)
                                                          .color],
                                                ),
                                                // Text(
                                                //   "2",
                                                //   style: TextStyle(
                                                //       color: Colors
                                                //           .pinkAccent.shade100,
                                                //       fontSize: 12,
                                                //       fontWeight: FontWeight.w500),
                                                // ),
                                                Icon(
                                                  Icons.flag_outlined,
                                                  color: categoryController
                                                          .iconColor[
                                                      categoryController
                                                          .categories
                                                          .firstWhere((element) =>
                                                              element.id ==
                                                              habbitSelectController
                                                                  .tasks[index]
                                                                  .categoryId)
                                                          .color],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: categoryController.iconColor[
                                          categoryController.categories
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  habbitSelectController
                                                      .tasks[index].categoryId)
                                              .color]
                                      .withOpacity(.3),
                                ),
                                child: Icon(
                                  Icons.brush,
                                  size: 23,
                                  color: categoryController.iconColor[
                                      categoryController.categories
                                          .firstWhere((element) =>
                                              element.id ==
                                              habbitSelectController
                                                  .tasks[index].categoryId)
                                          .color],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 90,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ListView.separated(
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: 7,
                          //     itemBuilder: (context, index) {
                          //       return Container(
                          //         height: 40,
                          //         width: 40,
                          //         decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             color: color.dialogBackgroundColor),
                          //       );
                          //     },
                          //     separatorBuilder: (context, index) => SW.small(),
                          //   ),
                          // )
                          SH.large(),
                          Obx(
                            () => habbitSelectController.openHabbits.contains(
                                    habbitSelectController
                                        .tasks[index].habbitId)
                                ? Row(
                                    children: [
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now()
                                                    .add(Duration(days: -6))
                                                    .day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now()
                                                .add(Duration(days: -6))
                                                .day)
                                            .toString(),
                                        isColor: true,
                                        selectColor: Colors.red,
                                      ),
                                      SW.small(),
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now()
                                                    .add(Duration(days: -5))
                                                    .day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now()
                                                .add(Duration(days: -5))
                                                .day)
                                            .toString(),
                                        isColor: true,
                                        selectColor: Colors.red,
                                      ),
                                      SW.small(),
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now()
                                                    .add(Duration(days: -4))
                                                    .day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now()
                                                .add(Duration(days: -4))
                                                .day)
                                            .toString(),
                                        isColor: true,
                                        selectColor: Colors.yellow,
                                      ),
                                      SW.small(),
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now()
                                                    .add(Duration(days: -3))
                                                    .day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now()
                                                .add(Duration(days: -3))
                                                .day)
                                            .toString(),
                                      ),
                                      SW.small(),
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now()
                                                    .add(Duration(days: -2))
                                                    .day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now()
                                                .add(Duration(days: -2))
                                                .day)
                                            .toString(),
                                      ),
                                      SW.small(),
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now()
                                                    .add(Duration(days: -1))
                                                    .day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now()
                                                .add(Duration(days: -1))
                                                .day)
                                            .toString(),
                                        isColor: true,
                                        selectColor: Colors.red,
                                      ),

                                      SW.small(),
                                      DateChip(
                                        day: DateFormat('EEEE')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now().day
                                                // DateTime.now()
                                                //     .add(Duration(days: index))
                                                //     .weekday

                                                ))
                                            .toString()
                                            .substring(0, 3),
                                        date: (DateTime.now().day).toString(),
                                        isColor: true,
                                        selectColor: Colors.green,
                                      ),
                                      // SW.small(),
                                    ],
                                  )
                                : SizedBox(),
                          ),
                          SH.large(),
                          Divider(
                            height: 2,
                            thickness: 2,
                            color: color.backgroundColor,
                          ),
                          SH.large(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.insert_link_rounded,
                                    color: categoryController.iconColor[
                                        categoryController.categories
                                            .firstWhere((element) =>
                                                element.id ==
                                                habbitSelectController
                                                    .tasks[index].categoryId)
                                            .color],
                                    size: 25,
                                  ),
                                  SW.small(),
                                  DescriptionText(
                                    isBold: true,
                                    text: "4",
                                    isColor: true,
                                    color: color.canvasColor,
                                  ),
                                  SW.medium(),
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: categoryController.iconColor[
                                        categoryController.categories
                                            .firstWhere((element) =>
                                                element.id ==
                                                habbitSelectController
                                                    .tasks[index].categoryId)
                                            .color],
                                    size: 25,
                                  ),
                                  SW.small(),
                                  DescriptionText(
                                    isBold: true,
                                    text: "52%",
                                    isColor: true,
                                    color: color.canvasColor,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: color.disabledColor,
                                    size: 25,
                                  ),
                                  SW.medium(),
                                  Icon(
                                    Icons.stacked_bar_chart,
                                    color: color.disabledColor,
                                    size: 25,
                                  ),
                                  SW.medium(),
                                  GestureDetector(
                                    onTap: () {
                                      switchController
                                                  .CollapseSwichChange.value ==
                                              true
                                          ? switchController
                                              .CollapseSwichChange.value = false
                                          : switchController
                                              .CollapseSwichChange.value = true;
                                      // print(switchController
                                      //     .CollapseSwichChange.value);
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        if (habbitSelectController.openHabbits
                                            .contains(habbitSelectController
                                                .tasks[index].habbitId)) {
                                          habbitSelectController.openHabbits
                                              .remove(habbitSelectController
                                                  .tasks[index].habbitId);
                                        } else {
                                          habbitSelectController.openHabbits
                                              .add(habbitSelectController
                                                  .tasks[index].habbitId);
                                        }
                                      },
                                      child: Obx(
                                        () => habbitSelectController.openHabbits
                                                .contains(habbitSelectController
                                                    .tasks[index].habbitId)
                                            ? Column(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_up_sharp,
                                                    color: color.disabledColor,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    color: color.disabledColor,
                                                    size: 15,
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    color: color.disabledColor,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_up_sharp,
                                                    color: color.disabledColor,
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                  SW.medium(),
                                  Icon(
                                    Icons.more_vert,
                                    color: color.disabledColor,
                                    size: 25,
                                  ),
                                ],
                              )
                            ],
                          )
                        ]),
                      ),
                    )
                  ]),
                );
              },
              itemCount: habbitSelectController.tasks.length,
              separatorBuilder: (context, index) => SH.large(),
            ),
          ),
        ),
      ),
    );
  }
}
