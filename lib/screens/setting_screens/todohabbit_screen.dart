// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/screens/customize_screen/components/completed_activities_customBox.dart';
import 'package:habbit_app/screens/customize_screen/components/textsize_custombox.dart';
import 'package:habbit_app/screens/setting_screens/habbit_sort_dialog.dart';
import 'package:habbit_app/screens/setting_screens/to_do_week_custombox.dart';
import 'package:habbit_app/screens/setting_screens/todo_sorting_dialog.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

import '../../widgets/text_widget/main_label_text.dart';

class ToDoHabbitListScreen extends StatelessWidget {
  const ToDoHabbitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        Get.back();
                      }),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: color.primaryColor,
                        ),
                      )),
                  SW.medium(),
                  MainLabelText(text: 'Todo and Habit Lists'.tr),
                ],
              ),
              SH.large(),
              SH.large(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 30,
                          color: color.primaryColor,
                        ),
                        SW.small(),
                        LabelText(text: "First day of week".tr)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        ToDoWeekCustomDialogBox(context);
                      },
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 35,
                          width: 110,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: color.canvasColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.backgroundColor),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Obx(
                              () => LabelText(
                                text: switchController.dayOfWeek.value,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SH.large(),
              SH.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Completed activity sorting".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      CompActCustomDialogBox(context);
                      // launchUrl(Uri.parse(
                      //     'upi://pay?pa=7698769876@sib&pn=ludogame&am=10&tn=Ludo%20rockland%20fees&cu=INR'));
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Obx(
                            () => LabelText(
                              text: switchController.activitySorting.value,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.list_alt_sharp,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Todo list order Sorting".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ToDoSortingDialogBox(context);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Obx(
                            () => LabelText(
                              text: switchController.todoSorting.value,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.large(),
              SH.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.format_list_bulleted_rounded,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Habit section order sorting".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      HabbitSortDialogBox(context);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Obx(
                            () => LabelText(
                              text: switchController.habbitSorting.value,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.large(),
              SH.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.text_fields,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Text sizing".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      TextCustomDialogBox(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: color.canvasColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Obx(
                            () => LabelText(
                              text: switchController.textSizing.value,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SH.medium(),
              SH.large(),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (() {}),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.touch_app,
                          size: 30,
                          color: color.primaryColor,
                        ),
                        SW.medium(),
                        LabelText(text: "Swap tap and long tap".tr)
                      ],
                    ),
                    Obx(
                      () => FlutterSwitch(
                        activeColor: color.primaryColor,
                        activeToggleColor: color.backgroundColor,

                        width: 50.0,
                        height: 25.0,
                        valueFontSize: 15.0,
                        toggleSize: 20.0,
                        value: switchController.SwipSwichChange.value,
                        borderRadius: 30.0,
                        padding: 2.0,
                        // showOnOff: true,
                        onToggle: (val) {
                          switchController.SwipSwichChange.value == true
                              ? switchController.SwipSwichChange.value = false
                              : switchController.SwipSwichChange.value = true;

                          switchController.setSwapData();

                          // status = val;
                          // setState(() {
                          //   status = val;
                          // });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.vibration,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Vibration".tr)
                    ],
                  ),
                  Obx(
                    () => FlutterSwitch(
                      activeColor: color.primaryColor,
                      activeToggleColor: color.backgroundColor,

                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 20.0,
                      value: switchController.SwichChange.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        switchController.SwichChange.value == true
                            ? switchController.SwichChange.value = false
                            : switchController.SwichChange.value = true;

                        switchController.setVibrationData();

                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
                  ),
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.library_books,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Collapse habit cards".tr)
                    ],
                  ),
                  Obx(
                    () => FlutterSwitch(
                      activeColor: color.primaryColor,
                      activeToggleColor: color.backgroundColor,

                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 20.0,
                      value: switchController.CollapseSwichChange.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        switchController.CollapseSwichChange.value == true
                            ? switchController.CollapseSwichChange.value = false
                            : switchController.CollapseSwichChange.value = true;

                        switchController.setCollapseData();
                        // if (switchController.CollapseSwichChange.value ==
                        //     false) {
                        //   print('object');
                        //   switchController.isOpen.value == true;
                        // }

                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
                  ),
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.animation,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Animation".tr)
                    ],
                  ),
                  Obx(
                    () => FlutterSwitch(
                      activeColor: color.primaryColor,
                      activeToggleColor: color.backgroundColor,

                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 20.0,
                      value: switchController.AnimationSwichChange.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        switchController.AnimationSwichChange.value == true
                            ? switchController.AnimationSwichChange.value =
                                false
                            : switchController.AnimationSwichChange.value =
                                true;
                        switchController.setAnimationData();

                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
                  ),
                ],
              ),
              SH.medium(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline_sharp,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Show awards".tr)
                    ],
                  ),
                  Obx(
                    () => FlutterSwitch(
                      activeColor: color.primaryColor,
                      activeToggleColor: color.backgroundColor,

                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 20.0,
                      value: switchController.AwardsSwichChange.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        switchController.AwardsSwichChange.value == true
                            ? switchController.AwardsSwichChange.value = false
                            : switchController.AwardsSwichChange.value = true;
                        switchController.setAwardData();
                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
                  ),
                ],
              ),
              SH.medium(),
              SH.large(),
            ],
          ),
        ),
      )),
    );
  }
}
