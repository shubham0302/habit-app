// ignore_for_file: unused_local_variable, sized_box_for_whitespace, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/tabController.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/custom_dialog_box.dart';
import 'package:habbit_app/widgets/date_widget.dart';
import 'package:habbit_app/widgets/icon_widget.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../../widgets/text_widget/description_text.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    TaskTabController tabController =
        Get.put(TaskTabController(), permanent: false);

    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      tabController.tabIndex.value = _controller.index;
      print(tabController.tabIndex.value);
    });
  }

  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();
    SwitchController switchController =
        Get.put(SwitchController(), permanent: true);
    AddTaskController addTaskController =
        Get.put(AddTaskController(), permanent: false);
    AddRecurringTaskController recurringTaskController =
        Get.put(AddRecurringTaskController(), permanent: false);
    TaskTabController tabController =
        Get.put(TaskTabController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    ThemeData color = Theme.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            CustomDialogBox(context);
          },
          backgroundColor: color.primaryColor,
          child: const Icon(Icons.add),
        ),
        backgroundColor: color.backgroundColor,
        body: SafeArea(
          child: GlobalPadding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // SH.med(),
              Obx(() {
                // tabController.tabIndex.value = _controller.index;
                return Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: TabBar(
                    // isScrollable: false,
                    isScrollable: false,
                    onTap: (index) {},
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    controller: _controller,
                    splashFactory: NoSplash.splashFactory,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: Colors.transparent,
                    ),

                    labelColor: color.cardColor,
                    unselectedLabelColor: color.disabledColor,
                    // indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Column(
                        children: [
                          Tab(
                            text: 'Single tasks'.tr,
                          ),
                          Container(
                            height: 2,
                            // width: ,
                            color: tabController.tabIndex.value == 0
                                ? color.primaryColor
                                : Colors.transparent,
                          )
                        ],
                      ),
                      // SizedBox(width: 5,),
                      Column(
                        children: [
                          Tab(
                            text: 'Recurring tasks'.tr,
                          ),
                          Container(
                            height: 2,
                            // width: ,
                            color: tabController.tabIndex.value == 1
                                ? color.primaryColor
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),

              SH.large(),
              Expanded(
                  child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [
                  Obx(
                    () => addTaskController.taskTimes.isEmpty
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
                                  text: 'No upcoming tasks'.tr,
                                  isBold: true,
                                ),
                                SH.small(),
                                 DescriptionText(
                                  text: 'There are no upcoming tasks'.tr,
                                  // isBold: true,
                                ),
                              ],
                            ),
                          )
                        : AnimationLimiter(
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: addTaskController.taskTimes.length,
                                separatorBuilder: (context, index) => Column(
                                      children: [
                                        SH.small(),
                                        const Divider(),
                                        SH.small(),
                                      ],
                                    ),
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: color.primaryColor
                                                      .withOpacity(.2)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 2),
                                                child: LabelText(
                                                  text: addTaskController
                                                      .taskTimes[index]
                                                      .toString(),
                                                  isColor: true,
                                                  // isBold: true,
                                                  color: color.primaryColor,
                                                ),
                                              ),
                                            ),
                                            SH.small(),
                                            const Divider(),
                                            SH.small(),
                                            Obx(
                                              () => ListView.separated(
                                                separatorBuilder:
                                                    (context, index) => Column(
                                                  children: [
                                                    SH.small(),
                                                    const Divider(),
                                                    SH.small(),
                                                  ],
                                                ),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: addTaskController
                                                                    .dataTasks[
                                                                addTaskController
                                                                        .taskTimes[
                                                                    index]] !=
                                                            null &&
                                                        addTaskController
                                                            .dataTasks[
                                                                addTaskController
                                                                        .taskTimes[
                                                                    index]]!
                                                            .isNotEmpty
                                                    ? addTaskController
                                                        .dataTasks[
                                                            addTaskController
                                                                    .taskTimes[
                                                                index]]!
                                                        .length
                                                    : 0,
                                                itemBuilder: (context, i) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      addTaskController.getTask(
                                                          addTaskController
                                                              .dataTasks[
                                                                  addTaskController
                                                                          .taskTimes[
                                                                      index]]![
                                                                  i]
                                                              .taskId);
                                                      // Get.toNamed(
                                                      //   '/edittask',
                                                      // );
                                                      // addTaskController.editIndex.value =
                                                      //     addTaskController.tasks[index].taskId;
                                                    },
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            // Container(
                                                            //   height: 30,
                                                            //   width: 30,
                                                            //   decoration: BoxDecoration(
                                                            //       borderRadius:
                                                            //           BorderRadius
                                                            //               .circular(8),
                                                            //       color: categoryController
                                                            //               .iconColor[
                                                            //           categoryController
                                                            //               .categories
                                                            //               .firstWhere((element) =>
                                                            //                   element.id ==
                                                            //                   addTaskController
                                                            //                       .dataTasks[
                                                            //                           addTaskController.taskTimes[index]]![
                                                            //                           i]
                                                            //                       .categoryId)
                                                            //               .color]),
                                                            //   child: Icon(
                                                            //     categoryController.icon[categoryController
                                                            //         .categories
                                                            //         .firstWhere((element) =>
                                                            //             element.id ==
                                                            //             addTaskController
                                                            //                 .dataTasks[
                                                            //                     addTaskController
                                                            //                             .taskTimes[
                                                            //                         index]]![
                                                            //                     i]
                                                            //                 .categoryId)
                                                            //         .icon],
                                                            //     size: 23,
                                                            //     color:
                                                            //         color.backgroundColor,
                                                            //   ),
                                                            // ),
                                                            Obx(() =>
                                                                IconWidgetClassic(
                                                                  contanerSize:
                                                                      true,
                                                                  contanerHight:
                                                                      30,
                                                                  contanerWidth:
                                                                      30,
                                                                  icon: categoryController.icon[categoryController
                                                                      .categories
                                                                      .firstWhere((element) =>
                                                                          element
                                                                              .id ==
                                                                          addTaskController
                                                                              .dataTasks[addTaskController.taskTimes[index]]![i]
                                                                              .categoryId)
                                                                      .icon],
                                                                  contanerColor: color
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? categoryController.iconColor[categoryController
                                                                          .categories
                                                                          .firstWhere((element) =>
                                                                              element.id ==
                                                                              addTaskController
                                                                                  .dataTasks[addTaskController.taskTimes[index]]![
                                                                                      i]
                                                                                  .categoryId)
                                                                          .color]
                                                                      : categoryController.iconLightColor[categoryController
                                                                          .categories
                                                                          .firstWhere(
                                                                              (element) => element.id == addTaskController.dataTasks[addTaskController.taskTimes[index]]![i].categoryId)
                                                                          .color],
                                                                )),
                                                            SW.medium(),
                                                            LabelText(
                                                                text: addTaskController
                                                                    .dataTasks[
                                                                        addTaskController
                                                                            .taskTimes[index]]![
                                                                        i]
                                                                    .taskName)
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Icon(Icons.done),
                                                        //     LabelText(
                                                        //         text: addTaskController
                                                        //             .checklists.length
                                                        //             .toString())
                                                        //   ],
                                                        // )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                  ),
                  Expanded(
                    child: Obx(
                      () => recurringTaskController.tasks.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    height: 150,
                                    width: 250,
                                    image:
                                        AssetImage('assets/images/tasks.png'),
                                  ),
                                  SH.large(),
                                   LabelText(
                                    text: 'No recurring tasks'.tr,
                                    isBold: true,
                                  ),
                                  SH.small(),
                                   DescriptionText(
                                    text: 'There are no recurring tasks'.tr,
                                    // isBold: true,
                                  ),
                                ],
                              ),
                            )
                          : AnimationLimiter(
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      recurringTaskController.tasks.length,
                                  separatorBuilder: (context, index) => Column(
                                        children: [
                                          SH.small(),
                                          const Divider(),
                                          SH.small(),
                                        ],
                                      ),
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: Row(
                                            children: [
                                              // Container(
                                              //   height: 30,
                                              //   width: 30,
                                              //   decoration: BoxDecoration(
                                              //       borderRadius:
                                              //           BorderRadius.circular(8),
                                              //       color: categoryController.iconColor[
                                              //           categoryController.categories
                                              //               .firstWhere((element) =>
                                              //                   element.id ==
                                              //                   recurringTaskController
                                              //                       .tasks[index]
                                              //                       .categoryId)
                                              //               .color]),
                                              //   child: Icon(
                                              //     categoryController.icon[
                                              //         categoryController.categories
                                              //             .firstWhere((element) =>
                                              //                 element.id ==
                                              //                 recurringTaskController
                                              //                     .tasks[index]
                                              //                     .categoryId)
                                              //             .icon],
                                              //     size: 23,
                                              //     color: color.backgroundColor,
                                              //   ),
                                              // ),
                                              Obx(() => IconWidgetClassic(
                                                    contanerSize: true,
                                                    contanerHight: 30,
                                                    contanerWidth: 30,
                                                    icon: categoryController
                                                            .icon[
                                                        categoryController
                                                            .categories
                                                            .firstWhere((element) =>
                                                                element.id ==
                                                                recurringTaskController
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
                                                                recurringTaskController
                                                                    .tasks[
                                                                        index]
                                                                    .categoryId)
                                                            .color]
                                                        : categoryController
                                                                .iconLightColor[
                                                            categoryController.categories
                                                                .firstWhere((element) =>
                                                                    element.id ==
                                                                    recurringTaskController
                                                                        .tasks[index]
                                                                        .categoryId)
                                                                .color],
                                                  )),
                                              SW.medium(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  LabelText(
                                                      text:
                                                          recurringTaskController
                                                              .tasks[index]
                                                              .rTaskName),
                                                  SH.medium(),
                                                  // Container(
                                                  //   decoration: BoxDecoration(
                                                  //       borderRadius:
                                                  //           BorderRadius.circular(3),
                                                  //       color: color.primaryColor
                                                  //           .withOpacity(.2)),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.symmetric(
                                                  //         horizontal: 5, vertical: 2),
                                                  //     child: LabelText(
                                                  //       text: 'Habit',
                                                  //       isColor: true,
                                                  //       isBold: true,
                                                  //       color: color.primaryColor,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                    ),
                  ),
                ],
              ))
            ]),
          ),
        ));
  }
}
