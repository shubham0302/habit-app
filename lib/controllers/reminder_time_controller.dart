// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderTimeController extends GetxController {
  var time = "".obs;
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
      time.value =
          timeTemp.hour.toString() + ':' + timeTemp.minute.toString() + ':';
    }
  }
}
