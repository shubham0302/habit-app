// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/infrastructure/db/app_service.dart';
import 'package:drift/drift.dart' as drift;

import 'db_controller.dart';

class AddTaskController extends GetxController {
  DBController dbcontroller = Get.find<DBController>();

  RxList<String> checklist = <String>[''].obs;

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
  var updatePriority = 0.obs;
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

  var taskName = ''.obs;
  var categoryId = 0.obs;
  RxBool isPending = false.obs;
  Rx<DateTime> date = DateTime.now().obs;
  addTask() async {
    try {
      var entity = TaskModelCompanion(
          taskName: drift.Value(taskName.value),
          categoryId: drift.Value(categoryId.value),
          taskDate: drift.Value(date.value),
          pendingTask: drift.Value(isPending.value),
          priority: drift.Value(updatePriority.value));

      var data = await dbcontroller.appDB   .insertTask(entity);
      // category.value = '';
      // iconType.value = 0;
      // colorIndex.value = 0;
      // log(data.toString());

      Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  // addCheckLists() async {
  //   try {
  //     var entity = CategoryModelCompanion(
  //         name: drift.Value(category.value),
  //          icon: drift.Value(),
          
          
  //         );

  //     var data = await dbcontroller.appDB.insertCategory(entity);
     
  //     log(data.toString());

  //     Get.back();
  //   } catch (e) {
  //     log('hahaha error ${e}');
  //   }
  // }

  RxList<TaskModelData> tasks = <TaskModelData>[].obs;
  getTasks() {
    try {
      dbcontroller.appDB    .streamTasks().forEach((element) {
        tasks.value = element;
        tasks.refresh();
        log(tasks.length.toString());
      });
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  // var date = DateTime.now().obs;
  // var staffJoinDate = DateTime.now().obs;
  // var staffJoinTime = DateTime(2010, 1, 1).obs;
  setDate(BuildContext c) async {
    final setdate = await showDatePicker(
        context: c,
        initialDate: date.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        initialDatePickerMode: DatePickerMode.year,
        builder: (c, Widget? child) {
          return MediaQuery(
              data: MediaQuery.of(c).copyWith(alwaysUse24HourFormat: false),
              child: child ?? Container());
        });
    if (setdate != null) {
      date.value = DateTime(setdate.year, setdate.month, setdate.day,
          date.value.hour, date.value.minute);
      print(date.value.toLocal().toString());
    }
    // if (date != null) {
    //   if (i == 0) {
    //     startDate.value =
    //         "${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString()}";
    //   } else {
    //     endDate.value =
    //         "${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString()}";
    //   }
    // }
  }
}
