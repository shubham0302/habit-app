// ignore_for_file: unused_local_variable, sized_box_for_whitespace, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/home_page_controller.dart';
import 'package:habbit_app/controllers/tabController.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/customize_screen/components/custom_dialog_box.dart';
import 'package:habbit_app/widgets/date_widget.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

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
    TaskTabController tabController =
        Get.put(TaskTabController(), permanent: false);

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

                    labelColor: Colors.white,
                    unselectedLabelColor: color.disabledColor,
                    // indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Column(
                        children: [
                          const Tab(
                            text: 'Single tasks',
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
                          const Tab(
                            text: 'Recurring tasks',
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
                controller: _controller,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SH.large(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: color.primaryColor.withOpacity(.2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: LabelText(
                            text: 'Habit',
                            isColor: true,
                            isBold: true,
                            color: color.primaryColor,
                          ),
                        ),
                      ),
                      GlobalPadding(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              const MainLabelText(text: 'Cooking')
                            ],
                          ),
                          SH.large(),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              const MainLabelText(text: 'Cooking')
                            ],
                          ),
                        ],
                      )),
                      SH.small(),
                      const Divider(thickness: 1),
                      SH.small(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: color.primaryColor.withOpacity(.2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: LabelText(
                            text: 'Habit',
                            isColor: true,
                            isBold: true,
                            color: color.primaryColor,
                          ),
                        ),
                      ),
                      GlobalPadding(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              const MainLabelText(text: 'Cooking')
                            ],
                          ),
                          SH.large(),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              const MainLabelText(text: 'Cooking')
                            ],
                          ),
                        ],
                      )),
                      SH.small(),
                      const Divider(thickness: 1),
                      SH.small(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: color.primaryColor.withOpacity(.2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: LabelText(
                            text: 'Habit',
                            isColor: true,
                            isBold: true,
                            color: color.primaryColor,
                          ),
                        ),
                      ),
                      GlobalPadding(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              const MainLabelText(text: 'Cooking')
                            ],
                          ),
                          SH.large(),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              const MainLabelText(text: 'Cooking')
                            ],
                          ),
                        ],
                      )),
                      SH.small(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SH.large(),
                      GlobalPadding(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MainLabelText(text: 'Cooking'),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            color.primaryColor.withOpacity(.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: color.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SH.small(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.small(),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MainLabelText(text: 'Cooking'),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            color.primaryColor.withOpacity(.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: color.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SH.small(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.small(),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MainLabelText(text: 'Cooking'),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            color.primaryColor.withOpacity(.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: color.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SH.small(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.small(),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.purpleAccent.shade100),
                                child: const Icon(
                                  Icons.brush,
                                  size: 35,
                                ),
                              ),
                              SW.large(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MainLabelText(text: 'Cooking'),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            color.primaryColor.withOpacity(.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: color.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ],
              ))
            ]),
          ),
        ));
  }
}
