// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:drift/drift.dart' as drift;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:intl/date_time_patterns.dart';

import '../infrastructure/db/app_service.dart';

class AddRecurringTaskController extends GetxController {
  DBController dbController = Get.find<DBController>();
  TextEditingController nameCtrl = TextEditingController();

  RxBool flexible = false.obs;
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController goal = TextEditingController();
  TextEditingController unit = TextEditingController();
  Rx<DateTime> startDate = DateTime(2022, 12, 20).obs;
  // Rx<TimeOfDay> reminderTime = const TimeOfDay(hour: 8, minute: 30).obs;
  Rx<DateTime> endDate = DateTime(2022, 12, 20).obs;
  RxString updateCategory = "Select".obs;
  Rx<Icon> categoryIcon = const Icon(
    Icons.checklist,
  ).obs;
  RxString updateRepetation = "Everyday".obs;
  RxInt updatePriority = 0.obs;
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
  var currentvalueSec = 0.obs;
  var currentvalueMin = 0.obs;
  var currentvalueHour = 0.obs;

  RxString timerDropDownValue = "At least".obs;
  RxString numericDropDownValue = "At least".obs;

  var addcheckbox = 1.obs;
  List<String> weekDayString = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<int> weekIndex = [0].obs;
  List<int> monthIndex = [0].obs;
  var singleDate = DateTime.now().obs;

  repiDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1997),
        lastDate: DateTime(2030));
    if (newDate == null) return;
    singleDate.value = newDate;
    // ToDoWeekCustomDialogBox(context);
  }

  // weekDay
  var categoryId = 0.obs;
  addTask(int reminder , int repetition) async {
    try {
      var entity = RecurringTaskModelCompanion(
        repetitonId: drift.Value(repetition),
        // repetition: drift.Value(updateRepetation.value),
        rTaskName: drift.Value(updateName.value),
        categoryId: drift.Value(categoryId.value),
        startDate: drift.Value(startDate.value),
        endDate: drift.Value(endDate.value),
        evaluate: drift.Value(selectEvaluate.value),
        rDescription: drift.Value(updateDescription.value),
        priority: drift.Value(updatePriority.value),
        reminderId: drift.Value(reminder),
      );

      var data = await dbController.appDB.insertRecurringTask(entity);

      await addCheckLists(data);
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<TextEditingController> recurringChecklist =
      <TextEditingController>[TextEditingController(text: '')].obs;
  addCheckLists(int taskId) async {
    try {
      await Future.forEach(
        recurringChecklist,
        (element) async {
          var entity = RecurringChecklistModelCompanion(
              rChecklistName: drift.Value(element.text),
              rTaskId: drift.Value(taskId));
          var data = await dbController.appDB.insertRecurringChecklist(entity);
        },
      );
      recurringChecklist.value = [TextEditingController(text: '')];

      // getTask(editIndexTemp)
      Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<RecurringChecklistModelData> checkListData =
      <RecurringChecklistModelData>[].obs;
  //  checkListData = .obs;
  Rx<DateTime> reminderTime = DateTime(0000, 00, 00, 08, 30).obs;

  var taskReminderId = 0.obs;
  addReminder(int repetition) async {
    try {
      var entity = TaskReminderModelCompanion(
          reminderTime: drift.Value(reminderTime.value),
          isAlways: drift.Value(alwaysenabled.value),
          isSound: drift.Value(customSound.value),
          isVibration: drift.Value(customVibration.value),
          isCompletedAc: drift.Value(customAlarm.value),
          days: drift.Value(customDays.join(',')));

      var data = await dbController.appDB.insertReminder(entity);

      reminderTime.value = DateTime.now();
      alwaysenabled.value = true;
      customSound.value = true;
      customVibration.value = true;
      customAlarm.value = true;
      customDays.value = [];

      await addTask(data,repetition );
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  var times = 0.obs;
  var repeatTime = 0.obs;
  var repeatPeriod = ''.obs;

  var timeWeek = ''.obs;
  addRepetition() async {
    try {
      var entity = RecurringRepetitionModelCompanion(
        daysMonth: drift.Value(monthIndex.join(',')),
        daysWeek: drift.Value(weekIndex.join(',')),
        repeat: drift.Value('${repeatTime.value},${repeatPeriod.value},${flexible.value}'),
        specificDay: drift.Value(singleDate.value),
        timePeriod: drift.Value('${times.value},${timeWeek.value}' ),
        type: drift.Value(updateRepetation.value),
      );

      var data = await dbController.appDB.insertRecurringRepetition(entity);


      await addReminder(data);
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<RecurringTaskModelData> tasks = <RecurringTaskModelData>[].obs;

  getTasks() {
    try {
      tasks.value = [];
      dbController.appDB.streamRecurringTasks().forEach((element) {
        tasks.value = element;
        tasks.refresh();
        log(tasks.length.toString());
      });
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<RecurringChecklistModelData> checklists =
      <RecurringChecklistModelData>[].obs;
  getChecklistss() {
    try {
      dbController.appDB.streamRecurringChecklist().forEach((element) {
        checklists.value = element;
        checklists.refresh();
        log(checklists.length.toString());
      });
    } catch (e) {
      log('hahaha error ${e}');
    }
  }
}
