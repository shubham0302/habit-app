// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages, unnecessary_string_interpolations, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/reminder_time_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/time_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
    ReminderTimeController reminderTimeController =
        Get.put(ReminderTimeController(), permanent: false);
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: color.primaryColor,
                    size: 20,
                  ),
                ),
                SW.medium(),
                const HeadingText(text: "Notifications and Alarms"),
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
                    const LabelText(text: "Notify daily programme")
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
                    value: switchController.NotifySwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.NotifySwichChange.value == true
                          ? switchController.NotifySwichChange.value = false
                          : switchController.NotifySwichChange.value = true;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_sharp,
                        size: 30,
                        color: color.primaryColor,
                      ),
                      SW.small(),
                      const LabelText(text: "Time")
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      notifyTimeController.setTime(context);
                    },
                    child: Obx(
                      () => Container(
                          alignment: Alignment.centerLeft,
                          height: 35,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.hintColor),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: LabelText(
                              text: "${notifyTimeController.time.value}",
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            SH.large(),
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
                    const LabelText(text: "Remind me to use the app")
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
                    value: switchController.RemindSwichChange.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      switchController.RemindSwichChange.value == true
                          ? switchController.RemindSwichChange.value = false
                          : switchController.RemindSwichChange.value = true;
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
                      Icons.watch_later_sharp,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Time")
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    reminderTimeController.setTime(context);
                  },
                  child: Obx(
                    () => Container(
                        alignment: Alignment.centerLeft,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: color.hintColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: LabelText(
                            text: "${reminderTimeController.time.value}",
                          ),
                        )),
                  ),
                )
              ],
            ),
            SH.large(),
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
                    const LabelText(text: "Alarm snooze time")
                  ],
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: color.hintColor),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: LabelText(
                        text: "10 minutes",
                      ),
                    ))
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
                    const LabelText(text: "Enabled for completed activities")
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
                      Icons.alarm_add_sharp,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Alarm settings")
                  ],
                ),
                // Container(
                //     height: 30,
                //     width: 110,
                //     child: const InputField(
                //       hintText: "Default",
                //     ))
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
                      Icons.refresh_sharp,
                      size: 30,
                      color: color.primaryColor,
                    ),
                    SW.medium(),
                    const LabelText(text: "Reprogram reminders")
                  ],
                ),
                // Obx(
                //   () => FlutterSwitch(
                //     activeColor: color.primaryColor,
                //     activeToggleColor: color.backgroundColor,

                //     width: 50.0,
                //     height: 25.0,
                //     valueFontSize: 15.0,
                //     toggleSize: 20.0,
                //     value: switchController.SwichChange.value,
                //     borderRadius: 30.0,
                //     padding: 2.0,
                //     // showOnOff: true,
                //     onToggle: (val) {
                //       switchController.SwichChange.value == true
                //           ? switchController.SwichChange.value = false
                //           : switchController.SwichChange.value = true;
                //       // status = val;
                //       // setState(() {
                //       //   status = val;
                //       // });
                //     },
                //   ),
                // ),
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
                    const LabelText(text: "Reminders not working")
                  ],
                ),
                // Obx(
                //   () => FlutterSwitch(
                //     activeColor: color.primaryColor,
                //     activeToggleColor: color.backgroundColor,

                //     width: 50.0,
                //     height: 25.0,
                //     valueFontSize: 15.0,
                //     toggleSize: 20.0,
                //     value: switchController.CollapseSwichChange.value,
                //     borderRadius: 30.0,
                //     padding: 2.0,
                //     // showOnOff: true,
                //     onToggle: (val) {
                //       switchController.CollapseSwichChange.value == true
                //           ? switchController.CollapseSwichChange.value = false
                //           : switchController.CollapseSwichChange.value = true;
                //       // status = val;
                //       // setState(() {
                //       //   status = val;
                //       // });
                //     },
                //   ),
                // ),
              ],
            ),
            SH.medium(),
            SH.large(),
          ],
        ),
      )),
    );
  }
}
