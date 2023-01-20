// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_brace_in_string_interps, unused_local_variable, avoid_function_literals_in_foreach_calls, avoid_print
import 'dart:developer';
import 'dart:io';
// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/infrastructure/db/app_service.dart';
import 'package:drift/drift.dart' as drift;
import 'package:path_provider/path_provider.dart';

import 'db_controller.dart';

class AddTaskController extends GetxController {
  DBController dbcontroller = Get.find<DBController>();
  var editIndex = 0.obs;

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
          print('object');
        }
      }
    } catch (err) {
      print("Cannot get download folder path");
    }
    print(directory?.path);
    return null;
  }

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController goal = TextEditingController();
  TextEditingController unit = TextEditingController();
  Rx<DateTime> startDate = DateTime(2022, 12, 20).obs;
  Rx<DateTime> reminderTime = DateTime(0000, 00, 00, 08, 30).obs;
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
  RxMap<String, List<TaskModelData>> dataTasks =
      <String, List<TaskModelData>>{}.obs;

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
  addTask(int reminder) async {
    try {
      var entity = TaskModelCompanion(
        taskName: drift.Value(taskName.value),
        categoryId: drift.Value(categoryId.value == 0 ? 1 : categoryId.value),
        taskDate: drift.Value(date.value),
        pendingTask: drift.Value(isPending.value),
        priority: drift.Value(updatePriority.value),
        reminderId: drift.Value(reminder),
      );

      var data = await dbcontroller.appDB.insertTask(entity);
      taskName.value = '';
      categoryId.value = 0;
      date.value = DateTime.now();
      isPending.value = false;
      updatePriority.value = 0;

      // category.value = '';
      // iconType.value = 0;
      // colorIndex.value = 0;
      // log(data.toString());
      await addCheckLists(data);

      // Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  editTask() async {
    try {
      var entity = TaskModelCompanion(
        taskId: drift.Value(editIndex.value),
        taskName: drift.Value(taskName.value),
        categoryId: drift.Value(categoryId.value),
        taskDate: drift.Value(date.value),
        pendingTask: drift.Value(isPending.value),
        priority: drift.Value(updatePriority.value),
        // reminderId: drift.Value(reminder),
      );

      var data = await dbcontroller.appDB.updateTask(entity);
      taskName.value = '';
      categoryId.value = 0;
      date.value = DateTime.now();
      isPending.value = false;
      updatePriority.value = 0;

      // category.value = '';
      // iconType.value = 0;
      // colorIndex.value = 0;
      // log(data.toString());
      // await editCheckLists();s

      // Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<ChecklistModelData> checkListData = <ChecklistModelData>[].obs;
  //  checkListData = .obs;
  var taskReminderId = 0.obs;
  addReminder() async {
    try {
      var entity = TaskReminderModelCompanion(
          reminderTime: drift.Value(reminderTime.value),
          isAlways: drift.Value(alwaysenabled.value),
          isSound: drift.Value(customSound.value),
          isVibration: drift.Value(customVibration.value),
          isCompletedAc: drift.Value(customAlarm.value),
          days: drift.Value(customDays.join(',')));

      var data = await dbcontroller.appDB.insertReminder(entity);

      reminderTime.value = DateTime.now();
      alwaysenabled.value = true;
      customSound.value = true;
      customVibration.value = true;
      customAlarm.value = true;
      customDays.value = [];
      // taskName.value = '';
      // categoryId.value = 0;
      // date.value = DateTime.now();
      // isPending.value = false;
      // updatePriority.value = 0;

      // category.value = '';
      // iconType.value = 0;
      // colorIndex.value = 0;
      // log(data.toString());
      await addTask(data);
      // await addCheckLists(data);

      // Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  editReminder() async {
    try {
      var entity = TaskReminderModelCompanion(
          id: drift.Value(taskReminderId.value),
          reminderTime: drift.Value(reminderTime.value),
          isAlways: drift.Value(alwaysenabled.value),
          isSound: drift.Value(customSound.value),
          isVibration: drift.Value(customVibration.value),
          isCompletedAc: drift.Value(customAlarm.value),
          days: drift.Value(customDays.join(',')));

      var data = await dbcontroller.appDB.updateReminder(entity);

      reminderTime.value = DateTime.now();
      alwaysenabled.value = true;
      customSound.value = true;
      customVibration.value = true;
      customAlarm.value = true;
      customDays.value = [];

      await editTask();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<TextEditingController> checklist =
      <TextEditingController>[TextEditingController(text: '')].obs;
  addCheckLists(int taskId) async {
    try {
      await Future.forEach(
        checklist,
        (element) async {
          var entity = ChecklistModelCompanion(
              checklistName: drift.Value(element.text),
              taslId: drift.Value(taskId));
          var data = await dbcontroller.appDB.insertChecklist(entity);
        },
      );
      checklist.value = [TextEditingController(text: '')];
      // getTask(editIndexTemp)
      Get.back();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  // editCheckLists(int taskId) async {
  //   try {
  //     await Future.forEach(
  //       checkListData,
  //       (element) async {
  //         var entity = ChecklistModelCompanion(
  //             id: drift.Value(element.id),
  //             checklistName: drift.Value(element.),
  //           );
  //         var data = await dbcontroller.appDB.insertChecklist(entity);
  //       },
  //     );
  //     checklist.value = [TextEditingController(text: '')];
  //     Get.back();
  //   } catch (e) {
  //     log('hahaha error ${e}');
  //   }
  // }

  RxList<TaskModelData> tasks = <TaskModelData>[].obs;
  RxList<String> taskTimes = <String>[].obs;
  getTasks() {
    try {
      tasks.value = [];
      dbcontroller.appDB.streamTasks().forEach((element) {
        tasks.value = element;
        taskTimes.value = [];
        dataTasks.value = {};

        // taskTimes.value = element.map((e) => e.taskDate).toList();

        element.forEach((ele) {
          if (!taskTimes.contains(
              '${ele.taskDate.year}-${ele.taskDate.month}-${ele.taskDate.day}')) {
            taskTimes.add(
                '${ele.taskDate.year}-${ele.taskDate.month}-${ele.taskDate.day}');
          }
          if (dataTasks.containsKey(
              '${ele.taskDate.year}-${ele.taskDate.month}-${ele.taskDate.day}')) {
            dataTasks[
                    '${ele.taskDate.year}-${ele.taskDate.month}-${ele.taskDate.day}']!
                .add(ele);
          } else {
            dataTasks[
                '${ele.taskDate.year}-${ele.taskDate.month}-${ele.taskDate.day}'] = [
              ele
            ];
          }
        });

        taskTimes.refresh();
        dataTasks.refresh();

        // element
        // element.reduce((value, element) => {})
        tasks.refresh();
        log(tasks.length.toString());
      });

      log(taskTimes.length.toString());
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

//  var task = ''.obs;
  getTask(int editIndexTemp) async {
    try {
      // task.value =
      var taskTemp = await dbcontroller.appDB.getTask(editIndexTemp);
      var checklistData = await dbcontroller.appDB.getChecklist(editIndexTemp);
      var reminderData =
          await dbcontroller.appDB.getReminder(taskTemp.reminderId);

      reminderTime.value = reminderData.reminderTime;
      customDays.value = reminderData.days.split(',');
      alwaysenabled.value = reminderData.isAlways;
      customSound.value = reminderData.isSound;
      customVibration.value = reminderData.isVibration;
      customAlarm.value = reminderData.isCompletedAc;
      // task.refresh();
      taskName.value = taskTemp.taskName;
      nameCtrl.text = taskTemp.taskName;
      categoryId.value = taskTemp.categoryId;
      updatePriority.value = taskTemp.priority;
      date.value = taskTemp.taskDate;
      isPending.value = taskTemp.pendingTask;
      checklist.value = checklistData
          .map((element) => TextEditingController(text: element.checklistName))
          .toList();

      Get.toNamed('/edittask');
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  RxList<ChecklistModelData> checklists = <ChecklistModelData>[].obs;
  getChecklistss() {
    try {
      dbcontroller.appDB.streamChecklist().forEach((element) {
        checklists.value = element;
        checklists.refresh();
        log(checklists.length.toString());
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
