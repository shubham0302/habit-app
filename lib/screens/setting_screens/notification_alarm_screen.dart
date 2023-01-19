// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages, unnecessary_string_interpolations, unused_field, prefer_final_fields, avoid_print

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/time_controller.dart';
import 'package:habbit_app/screens/notification/notifications.dart';
import 'package:habbit_app/screens/setting_screens/snooze_timer_dialog.dart';
import 'package:habbit_app/utilities/notification_utilities.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../widgets/text_widget/main_label_text.dart';

class NotificationandAlarmScreen extends StatefulWidget {
  const NotificationandAlarmScreen({super.key});

  @override
  State<NotificationandAlarmScreen> createState() =>
      _NotificationandAlarmScreenState();
}

class _NotificationandAlarmScreenState
    extends State<NotificationandAlarmScreen> {
  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);

  @override
  Widget build(BuildContext context) {
    NotifyTimeController notifyTimeController =
        Get.put(NotifyTimeController(), permanent: false);

    // ReminderTimeController reminderTimeController =
    //     Get.put(ReminderTimeController(), permanent: false);
    // SwitchController notifyTimeController =
    //     Get.put(SwitchController(), permanent: false);
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                  const MainLabelText(text: 'Notification and alarms'),
                ],
              ),
              SH.large(),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.small(),
                      LabelText(text: "Notify daily programme".tr)
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
                      value: notifyTimeController.dailyProgram.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        notifyTimeController.dailyProgram.value == true
                            ? notifyTimeController.dailyProgram.value = false
                            : notifyTimeController.dailyProgram.value = true;
                        notifyTimeController.setDailyData();
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
              GestureDetector(
                  onTap: () {},
                  child: Obx(
                    () => notifyTimeController.dailyProgram.value == true
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_sharp,
                                        size: 30,
                                        color: color.primaryColor,
                                      ),
                                      SW.small(),
                                      LabelText(text: "Time".tr)
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // notifyTimeController.setTime(context);
                                      if (notifyTimeController
                                              .dailyProgram.value ==
                                          true) {
                                        NotificationDailyPrograme?
                                            pickedSchedule =
                                            await pickSchedule(context);

                                        if (pickedSchedule != null) {
                                          createDailyNotification(
                                              pickedSchedule);
                                        }
                                      } else {}
                                    },
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 35,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: color.canvasColor),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: color.backgroundColor),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: LabelText(
                                            text: 'Select Time'.tr,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                              SH.large(),
                            ],
                          )
                        : const SizedBox(),
                  )),
              const Divider(
                thickness: 1,
              ),
              SH.large(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notification_important_rounded,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.small(),
                      LabelText(text: "Remind me to use the app".tr)
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
                      value: notifyTimeController.appNoti.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        notifyTimeController.appNoti.value == true
                            ? notifyTimeController.appNoti.value = false
                            : notifyTimeController.appNoti.value = true;
                        notifyTimeController.setAppData();

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
              Obx(() => notifyTimeController.appNoti.value == true
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_sharp,
                                  size: 30,
                                  color: color.primaryColor,
                                ),
                                SW.medium(),
                                LabelText(text: "Time".tr)
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                // notifyTimeController.setAppTime(context);
                                if (notifyTimeController.appNoti.value ==
                                    true) {
                                  NotificationRemindPrograme? pickedSchedule =
                                      await pickScheduled(context);

                                  if (pickedSchedule != null) {
                                    createReminderNotification(pickedSchedule);
                                  }
                                } else {}
                              },
                              child: Obx(
                                () => Container(
                                    alignment: Alignment.centerLeft,
                                    height: 35,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: color.canvasColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color.backgroundColor),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: LabelText(
                                        text: notifyTimeController
                                                    .appTime.value ==
                                                ''
                                            ? 'Select time'.tr
                                            : "${notifyTimeController.appTime.value}",
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                        SH.large(),
                      ],
                    )
                  : SizedBox()),
              const Divider(
                thickness: 1,
              ),
              SH.large(),
              SH.large(),
              SH.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.alarm_sharp,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Alarm snooze time".tr)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      snoozeTimeDialog(context);
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
                              text: notifyTimeController.minute.value == 0
                                  ? 'Select time'.tr
                                  : "${notifyTimeController.minute.value.toString()} minutes",
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
                        Icons.check_circle,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Enabled for completed activities".tr)
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
                      value: notifyTimeController.completedActivities.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      onToggle: (val) {
                        notifyTimeController.completedActivities.value == true
                            ? notifyTimeController.completedActivities.value =
                                false
                            : notifyTimeController.completedActivities.value =
                                true;
                        notifyTimeController.setCompletedData();
                      },
                    ),
                  ),
                ],
              ),
              SH.medium(),
              SH.large(),
              GestureDetector(
                onTap: () {
                  AppSettings.openNotificationSettings();
                  print('object');
                },
                behavior: HitTestBehavior.translucent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_add_sharp,
                          size: 30,
                          color: color.primaryColor,
                        ),
                        SW.medium(),
                        LabelText(text: "Alarms setting".tr)
                      ],
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
                        Icons.refresh_sharp,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: "Reprogram reminders".tr)
                    ],
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
                        Icons.notifications_off,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.medium(),
                      LabelText(text: 'Reminders not working'.tr)
                    ],
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
