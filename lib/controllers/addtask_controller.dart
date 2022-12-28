// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController goal = TextEditingController();
  TextEditingController unit = TextEditingController();
  Rx<DateTime> startDate = DateTime(2022, 12, 20).obs;
  Rx<TimeOfDay> reminderTime = const TimeOfDay(hour: 8, minute: 30).obs;
  Rx<DateTime> endDate = DateTime(2022, 12, 20).obs;
  RxString updateCategory = "Select".obs;
  Rx<Icon> categoryIcon = const Icon(
    Icons.checklist,
  ).obs;
  RxString updateRepetation = "Everyday".obs;
  RxString updatePriority = "0".obs;
  RxString updateName = "".obs;
  RxString updateDescription = "".obs;
  RxString updateGoal = "".obs;
  RxString updateUnit = "".obs;
  RxString selectEvaluate = "YES OR NO".obs;
  RxBool alwaysenabled = true.obs;
  RxList<String> customDays = <String>[].obs;

  RxBool customSound = true.obs;
  RxBool customVibration = true.obs;
  RxBool customAlarm = true.obs;
  RxBool pendingTask = true.obs;
  var currentvalueSec = 0.obs;
  var currentvalueMin = 0.obs;
  var currentvalueHour = 0.obs;

  RxString timerDropDownValue = "At least".obs;
  RxString numericDropDownValue = "At least".obs;

  var addcheckbox = 1.obs;
}
