import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/helpers/local_storage_helper.dart';

class NotifyTimeController extends GetxController {
  RxBool dailyProgram = true.obs;
  RxBool appNoti = true.obs;
  RxBool completedActivities = true.obs;
  var appTime = "".obs;
  var minute = 0.obs;
  setAppTime(
    BuildContext c,
  ) async {
    var timeTemp = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: c,
        builder: (c, Widget? child) {
          ThemeData color = Theme.of(c);
          return Theme(
              data: Theme.of(c).copyWith(
                colorScheme: ColorScheme.light(
                    brightness: Brightness.dark,
                    // primaryContainer: color.primaryColor,
                    primary: color.primaryColor, // <-- SEE HERE
                    onPrimary: color.hintColor, // <-- SEE HERE
                    onSurface: color.hintColor,
                    secondary: color.disabledColor.withOpacity(0.2),
                    background: color.hintColor,
                    onBackground: color.highlightColor),
              ),
              child: child ?? Container());
          // MediaQuery(
          //     data: MediaQuery.of(c).copyWith(alwaysUse24HourFormat: false),
          //     child: child ?? Container());
        });
    if (timeTemp != null) {
      appTime.value =
          timeTemp.hour.toString() + ':' + timeTemp.minute.toString();
      setAppTimeData();
    }
  }

  var dailyTime = "".obs;
  setTime(
    BuildContext c,
  ) async {
    var timeTemp = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: c,
        builder: (c, Widget? child) {
          ThemeData color = Theme.of(c);
          return Theme(
              data: Theme.of(c).copyWith(
                colorScheme: ColorScheme.light(
                    brightness: Brightness.dark,
                    // primaryContainer: color.primaryColor,
                    primary: color.primaryColor, // <-- SEE HERE
                    onPrimary: color.hintColor, // <-- SEE HERE
                    onSurface: color.hintColor,
                    secondary: color.disabledColor.withOpacity(0.2),
                    background: color.hintColor,
                    onBackground: color.highlightColor),
              ),
              child: child ?? Container());
          // MediaQuery(
          //     data: MediaQuery.of(c).copyWith(alwaysUse24HourFormat: false),
          //     child: child ?? Container());
        });
    if (timeTemp != null) {
      dailyTime.value =
          timeTemp.hour.toString() + ':' + timeTemp.minute.toString();
      setDailyTimeData();
    }
  }

  setDailyData() async {
    await LocalStorageHelper.setItem(
        "dailynoti", dailyProgram.value.toString());
  }

  setMinuteData() async {
    await LocalStorageHelper.setItem("minute", minute.value.toString());
  }

  setDailyTimeData() async {
    await LocalStorageHelper.setItem("dailyTime", dailyTime.value.toString());
  }

  setAppTimeData() async {
    await LocalStorageHelper.setItem("apptime", appTime.value.toString());
  }

  setAppData() async {
    await LocalStorageHelper.setItem("appnoti", appNoti.value.toString());
  }

  setCompletedData() async {
    await LocalStorageHelper.setItem(
        "completed", completedActivities.value.toString());
  }

  getFromLoacal() async {
    var daily = await LocalStorageHelper.getItem('dailynoti');
    var app = await LocalStorageHelper.getItem('appnoti');
    var completed = await LocalStorageHelper.getItem('completed');
    var dailyTimen = await LocalStorageHelper.getItem('dailyTime');
    dailyTime.value = dailyTimen ?? 'Select Time';
    var appTimen = await LocalStorageHelper.getItem('apptime');
    appTime.value = appTimen ?? 'Select Time';
    var minuten = await LocalStorageHelper.getItem('minute');
    minute.value = int.parse(minuten);
    // var vibrate= await LocalStorageHelper.getItem('wantVibration');
    // var swap = await LocalStorageHelper.getItem('wantSwap');
    // var dayweek = await LocalStorageHelper.getItem('dayweek');
    // dayOfWeek.value = dayweek ?? 'Sunday';
    // var activitySort = await LocalStorageHelper.getItem('activitysort');
    // activitySorting.value = activitySort ?? 'Keep in place';
    // var todosort = await LocalStorageHelper.getItem('todosort');
    // todoSorting.value = todosort ?? 'Alphabetical';
    // var habbitsort = await LocalStorageHelper.getItem('habbitsort');
    // habbitSorting.value = habbitsort ?? 'Alphabetical';
    // var textsize = await LocalStorageHelper.getItem('textsize');
    // textSizing.value = textsize ?? 'Default';

    if (daily == 'false') {
      dailyProgram.value = false;
    } else {
      dailyProgram.value = true;
    }
    if (app == 'false') {
      appNoti.value = false;
    } else {
      appNoti.value = true;
    }
    if (completed == 'false') {
      completedActivities.value = false;
    } else {
      completedActivities.value = true;
    }
    // if (vibrate == 'false') {
    //   SwichChange.value = false;
    // } else {
    //   SwichChange.value = true;
    // }
    // if (swap == 'false') {
    //   SwipSwichChange.value = false;
    // } else {
    //   SwipSwichChange.value = true;
    // }
  }

  @override
  void onInit() {
    getFromLoacal();
    // TODO: implement onInit
    super.onInit();
  }
}
