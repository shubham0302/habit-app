// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/screens/notification/notifications.dart';
import 'package:habbit_app/utilities/notification_utilities.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:lottie/lottie.dart';

void reminderCustomDialogBox(BuildContext context) {
  // TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 30);
  AddHabbitSelectController addHabbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  void _showTimePicker() async {
    try {
      ThemeData color = Theme.of(context);
      var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: addHabbitSelectController.reminderTime.value.hour,
            minute: addHabbitSelectController.reminderTime.value.minute),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  //  textButtonTheme: ,
                  // textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle:)),
                  colorScheme: ColorScheme.light(
                      primary: color.primaryColor,
                      onPrimary: color.hintColor,
                      onSurface: color.hintColor,
                      background: color.backgroundColor,
                      onBackground: color.backgroundColor,
                      primaryContainer: color.backgroundColor)),
              child: child!);
        },
      );
      if (time != null) {
        addHabbitSelectController.remTime.value = time;
      }
      // .then((v) {
      //   addHabbitSelectController.reminderTime.value = DateTime(
      //       addHabbitSelectController.startDate.value.year,
      //       addHabbitSelectController.startDate.value.month,
      //       addHabbitSelectController.startDate.value.day,
      //       v!.hour,
      //       v.minute,
      //       00);

      //   // addHabbitSelectController.
      // });
    } catch (e) {}
  }

  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  backgroundColor: color.backgroundColor,
                  content: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Center(child: LabelText(text: 'Reminders')),
                      SH.medium(),
                      Divider(),
                      SH.medium(),
                      Obx(
                        () => Container(
                          // height: 100,
                          // decoration: BoxDecoration(),
                          // constraints: BoxConstraints(
                          //   maxHeight: 100
                          // ),
                          child:
                              // ListView.separated(
                              //   // shrinkWrap: true,
                              //   itemBuilder: (context, index) {
                              //   return Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Icon(Icons.notifications),
                              //       Column(
                              //         children: [
                              //           MainLabelText(text: '12:00 PM'),
                              //           SH.small(),
                              //           LabelText(text: 'Always'),
                              //         ],
                              //       ),
                              //       Icon(Icons.delete_outline),
                              //     ],
                              //   );
                              // }, separatorBuilder: (context, index) {
                              //   return Divider();
                              // },
                              // itemCount: addHabbitSelectController.remList.length
                              // ),
                              Column(
                            children: [
                              ...addHabbitSelectController.remList.isNotEmpty
                                  ? addHabbitSelectController.remList
                                      .map((element) => Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // addHabbitSelectController.remId.value = element.id!;
                                                    addHabbitSelectController
                                                        .remTime
                                                        .value = element.time!;
                                                    addHabbitSelectController
                                                        .remType
                                                        .value = element.type!;
                                                    addHabbitSelectController
                                                            .always.value =
                                                        element.always!;
                                                    addHabbitSelectController
                                                        .remDays
                                                        .value = element.days!;
                                                    addHabbitSelectController
                                                        .remEditId
                                                        .value = element.id!;
                                                    reminderCustomDialogTimerBox(
                                                        context, true);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                          width: 40,
                                                          height: 40,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: color
                                                                .primaryColor
                                                                .withOpacity(
                                                                    0.2),
                                                          ),
                                                          child: Icon(
                                                            element.type ==
                                                                    "notification"
                                                                ? Icons
                                                                    .notifications
                                                                : element.type ==
                                                                        "noremind"
                                                                    ? Icons
                                                                        .notifications_off
                                                                    : Icons
                                                                        .alarm,
                                                            size: 20,
                                                          )),
                                                      Column(
                                                        children: [
                                                          MainLabelText(
                                                              text: element
                                                                  .time!
                                                                  .format(
                                                                      context)
                                                                  .toString()),
                                                          // SH.small(),
                                                          DescriptionText(
                                                            text: element
                                                                        .always ==
                                                                    true
                                                                ? 'Always Enabled'
                                                                : element.days!
                                                                    .map((e) => e
                                                                        .toLowerCase()
                                                                        .capitalize)
                                                                    .join(
                                                                        ' - '),
                                                            isColor: true,
                                                          ),
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          addHabbitSelectController
                                                              .remList
                                                              .remove(element);
                                                          addHabbitSelectController
                                                              .remList
                                                              .refresh();
                                                        },
                                                        child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: color
                                                                  .dividerColor
                                                                  .withOpacity(
                                                                      0.2),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              size: 20,
                                                              color: color
                                                                  .cardColor,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider()
                                            ],
                                          ))
                                      .toList()
                                  : [
                                      Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 140,
                                              width: 140,
                                              child: Lottie.asset(
                                                  'assets/lottie/bell.json',
                                                  repeat: false,
                                                  fit: BoxFit.fill),
                                            ),
                                            DescriptionText(
                                                text:
                                                    'No reminders for this activity')
                                          ],
                                        ),
                                      ),
                                      SH.medium(),
                                    ]
                            ],
                          ),
                        ),
                      ),
                      // SH.medium(),
                      // Divider(),
                      SH.medium(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          reminderCustomDialogTimerBox(context, false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: color.primaryColor)),
                                child: Icon(Icons.add)),
                            SW.medium(),
                            LabelText(text: 'NEW REMINDER')
                          ],
                        ),
                      ),
                      SH.medium(),
                      Divider(),
                      SH.medium(),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child:
                                      Center(child: LabelText(text: 'CLOSE')))),
                        ],
                      ),
                    ],
                  ))),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });
}

void reminderCustomDialogTimerBox(BuildContext context, bool isEdit) {
  // TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 30);
  AddHabbitSelectController addHabbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  void _showTimePicker() async {
    try {
      ThemeData color = Theme.of(context);
      var time = await showTimePicker(
        context: context,
        initialTime: addHabbitSelectController.remTime.value,
        builder: (
          context,
          child,
        ) {
          return Theme(
              data: Theme.of(context).copyWith(
                  //  textButtonTheme: ,
                  // textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle:)),
                  colorScheme: ColorScheme.light(
                      primary: color.primaryColor,
                      onPrimary: color.hintColor,
                      onSurface: color.hintColor,
                      background: color.backgroundColor,
                      onBackground: color.backgroundColor,
                      primaryContainer: color.backgroundColor)),
              child: child!);
        },
      );
      if (time != null) {
        addHabbitSelectController.remTime.value = time;
      }
      // .then((v) {
      //   addHabbitSelectController.reminderTime.value = DateTime(
      //       addHabbitSelectController.startDate.value.year,
      //       addHabbitSelectController.startDate.value.month,
      //       addHabbitSelectController.startDate.value.day,
      //       v!.hour,
      //       v.minute,
      //       00);

      //   // addHabbitSelectController.
      // });
    } catch (e) {}
  }

  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (
        context,
        a1,
        a2,
        widget,
      ) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: GlobalPadding(
                child: AlertDialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    backgroundColor: color.backgroundColor,
                    content: Wrap(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: LabelText(text: "Reminders".tr)),
                                SH.medium(),
                                const Divider(
                                  thickness: 1,
                                ),
                                SH.medium(),
                                GestureDetector(
                                    onTap: () {
                                      _showTimePicker();
                                    },
                                    child: Center(
                                      child: Obx(
                                        () => MainLabelText(
                                            text: TimeOfDay(
                                                    hour:
                                                        addHabbitSelectController
                                                            .remTime.value.hour,
                                                    minute:
                                                        addHabbitSelectController
                                                            .remTime
                                                            .value
                                                            .minute)
                                                .format(context)
                                                .toString()),
                                      ),
                                    )),
                                Center(
                                  child: LabelText(
                                    text: "Reminder time".tr,
                                    isColor: true,
                                  ),
                                ),
                                SH.medium(),
                                const Divider(),
                                SH.medium(),
                                LabelText(
                                  text: "Reminder type".tr,
                                  isColor: true,
                                ),

                                SH.medium(),

                                Obx(
                                  () => Container(
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: color.dividerColor),
                                        color: color.dividerColor
                                            .withOpacity(0.2)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: () {
                                              addHabbitSelectController
                                                  .remType.value = "noremind";
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: addHabbitSelectController
                                                            .remType.value ==
                                                        "noremind"
                                                    ? color.primaryColor
                                                        .withOpacity(0.2)
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20)),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_off_outlined,
                                                    size: 25,
                                                    color:
                                                        addHabbitSelectController
                                                                    .remType
                                                                    .value ==
                                                                "noremind"
                                                            ? color.primaryColor
                                                            : color.cardColor,
                                                  ),
                                                  SH.small(),
                                                  LabelText(
                                                    text: 'Don\'t remind',
                                                    isColor:
                                                        addHabbitSelectController
                                                                .remType
                                                                .value ==
                                                            "noremind",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Expanded(
                                          child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: () {
                                              addHabbitSelectController.remType
                                                  .value = "notification";
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      addHabbitSelectController
                                                                  .remType
                                                                  .value ==
                                                              "notification"
                                                          ? color.primaryColor
                                                              .withOpacity(0.2)
                                                          : Colors.transparent,
                                                  border: Border.symmetric(
                                                      vertical: BorderSide(
                                                          color: color
                                                              .dividerColor))),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              // color: color.primaryColor.withOpacity(0.2),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_outlined,
                                                    size: 25,
                                                    color:
                                                        addHabbitSelectController
                                                                    .remType
                                                                    .value ==
                                                                "notification"
                                                            ? color.primaryColor
                                                            : color.cardColor,
                                                  ),
                                                  SH.small(),
                                                  LabelText(
                                                    text: 'Notification',
                                                    isColor:
                                                        addHabbitSelectController
                                                                .remType
                                                                .value ==
                                                            "notification",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Expanded(
                                          child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: () {
                                              addHabbitSelectController
                                                  .remType.value = "alarm";
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: addHabbitSelectController
                                                            .remType.value ==
                                                        "alarm"
                                                    ? color.primaryColor
                                                        .withOpacity(0.2)
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20)),
                                                // border: Border.symmetric(vertical: BorderSide(color: color.dividerColor))
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              // color: color.primaryColor.withOpacity(0.2),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.alarm,
                                                    size: 25,
                                                    color:
                                                        addHabbitSelectController
                                                                    .remType
                                                                    .value ==
                                                                "alarm"
                                                            ? color.primaryColor
                                                            : color.cardColor,
                                                  ),
                                                  SH.small(),
                                                  LabelText(
                                                    text: 'Alarm',
                                                    isColor:
                                                        addHabbitSelectController
                                                                .remType
                                                                .value ==
                                                            "alarm",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SH.medium(),
                                const Divider(),
                                SH.medium(),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         const Icon(
                                //           Icons.notifications_on_outlined,
                                //           size: 20,
                                //         ),
                                //         SW.medium(),
                                //         LabelText(text: "Sound enabled".tr),
                                //       ],
                                //     ),
                                //     GestureDetector(
                                //       onTap: () {
                                //         addHabbitSelectController.remType.value = "notification";
                                //         // addHabbitSelectController.customSound.value = !addHabbitSelectController.customSound.value;
                                //       },
                                //       child: Obx(
                                //         () => Icon(
                                //           addHabbitSelectController.remType.value=="notification"
                                //               ? Icons.check_circle
                                //               : Icons.circle_outlined,
                                //           color: color.primaryColor,
                                //           size: 25,
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SH.medium(),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         const Icon(
                                //           Icons.vibration,
                                //           size: 20,
                                //         ),
                                //         SW.medium(),
                                //         LabelText(text: "Vibration enabled".tr),
                                //       ],
                                //     ),
                                //     GestureDetector(
                                //       onTap: () {
                                //         addHabbitSelectController
                                //                     .customVibration.value = !addHabbitSelectController
                                //                     .customVibration.value;
                                //       },
                                //       child: Obx(
                                //         () => Icon(
                                //           addHabbitSelectController
                                //                   .customVibration.value
                                //               ? Icons.check_circle
                                //               : Icons.circle_outlined,
                                //           color: color.primaryColor,
                                //           size: 25,
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SH.medium(),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         const Icon(
                                //           Icons.alarm_on_rounded,
                                //           size: 20,
                                //         ),
                                //         SW.medium(),
                                //         LabelText(
                                //             text:
                                //                 "Enbled for completed activities"
                                //                     .tr),
                                //       ],
                                //     ),
                                //     GestureDetector(
                                //       onTap: () {
                                //         addHabbitSelectController
                                //                     .customAlarm.value = !addHabbitSelectController
                                //                     .customAlarm.value;
                                //       },
                                //       child: Obx(
                                //         () => Icon(
                                //           addHabbitSelectController
                                //                   .customAlarm.value
                                //               ? Icons.check_circle
                                //               : Icons.circle_outlined,
                                //           color: color.primaryColor,
                                //           size: 25,
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SH.medium(),
                                // const Divider(),
                                // SH.medium(),
                                LabelText(
                                  text: "Reminder schedule".tr,
                                  isColor: true,
                                ),
                                SH.large(),
                                Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        addHabbitSelectController.always.value =
                                            true;
                                        // addHabbitSelectController
                                        //     .alwaysenabled.value = false;
                                      },
                                      child: Obx(
                                        () => Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // color: color.primaryColor,
                                              border: Border.all(
                                                color:
                                                    !addHabbitSelectController
                                                            .always.value
                                                        ? color.disabledColor
                                                        : color.primaryColor,
                                                width: 2,
                                                //   strokeAlign: StrokeAlign.outside,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    !addHabbitSelectController
                                                            .always.value
                                                        ? Colors.transparent
                                                        : color.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SW.medium(),
                                    LabelText(text: "ALways enabled".tr)
                                  ],
                                ),
                                SH.medium(),
                                Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        addHabbitSelectController.always.value =
                                            false;
                                      },
                                      child: Obx(
                                        () => Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // color: color.primaryColor,
                                              border: Border.all(
                                                color: addHabbitSelectController
                                                        .always.value
                                                    ? color.disabledColor
                                                    : color.primaryColor,
                                                width: 2,
                                                // strokeAlign: StrokeAlign.outside,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: addHabbitSelectController
                                                        .always.value
                                                    ? Colors.transparent
                                                    : color.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SW.medium(),
                                    LabelText(text: "Custom".tr)
                                  ],
                                ),
                                SH.medium(),
                                const Divider(),
                                SH.medium(),
                                Obx(
                                  () => !addHabbitSelectController.always.value
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                ...[
                                                  'SUN',
                                                  'MON',
                                                  'TUE',
                                                  'WED',
                                                  'THU',
                                                  'FRI',
                                                  'SAT'
                                                ]
                                                    .map(
                                                      (e) => Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            if (addHabbitSelectController
                                                                .remDays
                                                                .contains(e)) {
                                                              addHabbitSelectController
                                                                  .remDays
                                                                  .remove(e);
                                                            } else {
                                                              addHabbitSelectController
                                                                  .remDays
                                                                  .add(e);
                                                            }
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: 60,
                                                              width: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: color
                                                                          .disabledColor
                                                                          .withOpacity(
                                                                              0.1),
                                                                      width:
                                                                          1)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        1.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Expanded(
                                                                        child: Center(
                                                                            child: DescriptionText(
                                                                      text: e,
                                                                      isColor: addHabbitSelectController
                                                                          .remDays
                                                                          .contains(
                                                                              e),
                                                                    ))),
                                                                    Container(
                                                                      height: 5,
                                                                      color: addHabbitSelectController.remDays.contains(
                                                                              e)
                                                                          ? color
                                                                              .primaryColor
                                                                          : color
                                                                              .disabledColor,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ],
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                                SH.medium(),
                                Divider(),
                                // SH.medium(),
                                Container(
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                      // color: color.primaryColor.withOpacity(0.2)
                                      // border: Border.symmetric(horizontal: Border)
                                      ),
                                  height: 30,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                              onTap: () {
                                                addHabbitSelectController
                                                    .cancelReminderToList();
                                              },
                                              child: Center(
                                                  child: LabelText(
                                                      text: 'CANCEL')))),
                                      Container(
                                        width: 0.5,
                                        color: color.dividerColor,
                                      ),
                                      Expanded(
                                          child: GestureDetector(
                                              onTap: () async {
                                                if (isEdit) {
                                                  addHabbitSelectController
                                                      .editReminderToList();
                                                } else {
                                                  addHabbitSelectController
                                                      .addReminderToList();
                                                }
                                                // print(addHabbitSelectController
                                                //     .remTime.value.hour
                                                //     .toString());
                                                // print(addHabbitSelectController
                                                //     .remTime.value.minute
                                                //     .toString());
                                                // NotificationHabitReminder?
                                                //     pickedSchedule =
                                                //     await pickHabitReminder(
                                                //         context, i);

                                                // if (pickedSchedule != null) {
                                                //   habitReminderNotification(
                                                //     pickedSchedule,
                                                //   );
                                                // }
                                                // addHabbitSelectController
                                                //     .addReminderNotification(
                                                //         context);
                                              },
                                              child: Center(
                                                  child: LabelText(
                                                text: 'CONFIRM',
                                                isColor: true,
                                              )))),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ],
                    )),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (
        context,
        animation1,
        animation2,
      ) {
        return SizedBox();
      });
}
