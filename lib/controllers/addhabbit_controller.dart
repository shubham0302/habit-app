// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, avoid_print

import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:drift/drift.dart' as drift;
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:path/path.dart';
import 'package:vibration/vibration.dart';

import '../infrastructure/db/app_service.dart';
import '../screens/notification/notifications.dart';
import '../utilities/notification_utilities.dart';

class AddHabbitSelectController extends GetxController {
  DBController dbcontroller = Get.find<DBController>();
  SwitchController switchController =
      Get.put(SwitchController(), permanent: false);
  TextEditingController nameCtrl = TextEditingController();

  RxBool flexible = false.obs;
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController goal = TextEditingController();
  TextEditingController unit = TextEditingController();
  Rx<DateTime> startDate = DateTime.now().obs;
  // Rx<TimeOfDay> reminderTime = const TimeOfDay(hour: 8, minute: 30).obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  RxString updateCategory = "Select".obs;
  // RxList<int> habitStatus = <int>[].obs;
  RxString habitStatus = 'pending'.obs;
  Rx<Icon> categoryIcon = const Icon(
    Icons.checklist,
  ).obs;
  RxBool isArcive = false.obs;
  RxString updateRepetation = "Everyday".obs;
  RxInt updatePriority = 0.obs;
  RxInt numaricStatus = 0.obs;
  RxInt numaricStatus2 = 20.obs;
  RxInt timeMinStatus = 0.obs;
  RxInt timeHourStatus = 0.obs;
  RxInt timeSecStatus = 0.obs;
  RxString updateName = "".obs;
  RxString updateDescription = "".obs;
  RxString updateGoal = "".obs;
  RxString updateUnit = "".obs;
  RxString selectEvaluate = "YES OR NO".obs;
  RxBool alwaysenabled = true.obs;
  RxList<String> customDays = <String>[].obs;
  RxBool habitArcive = false.obs;

  RxBool customSound = true.obs;
  RxBool customVibration = true.obs;
  RxBool customAlarm = true.obs;
  var currentvalueSec = 0.obs;
  var currentvalueMin = 0.obs;
  var currentvalueHour = 0.obs;
  var editIndex = 0.obs;
  var taskName = ''.obs;
  var categoryId = 0.obs;
  RxBool isPending = false.obs;
  Rx<DateTime> date = DateTime.now().obs;

  RxString timerDropDownValue = "At least".obs;
  RxString numericDropDownValue = "At least".obs;

  var addcheckbox = 1.obs;
  List<String> weekDayString = [
    "Monday".tr,
    "Tuesday".tr,
    "Wednesday".tr,
    "Thursday".tr,
    "Friday".tr,
    "Saturday".tr,
    "Sunday".tr
  ];
  RxList<int> openHabbits = <int>[].obs;
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

  addHabbit(int repetition, BuildContext context) async {
    try {
      var entity = HabbitModelCompanion(
          repetitonId: drift.Value(repetition),
          // repetition: drift.Value(updateRepetation.value),
          habitName: drift.Value(updateName.value),
          habitSucess: drift.Value(selectEvaluate.value == "YES OR NO"
              ? 'true'
              : selectEvaluate.value == "Numeric"
                  ? updateGoal.value
                  : selectEvaluate.value == "Timer"
                      ? "${currentvalueHour.value}:${currentvalueMin.value}:${currentvalueSec.value}"
                      : "true"),
          habitSucessType: drift.Value(numericDropDownValue.value),
          habitSucessUnit: drift.Value(updateUnit.value),
          categoryId: drift.Value(categoryId.value == 0 ? 1 : categoryId.value),
          startDate: drift.Value(startDate.value),
          endDate: drift.Value(endDate.value),
          evaluate: drift.Value(selectEvaluate.value),
          habbitDescription: drift.Value(updateDescription.value),
          priority: drift.Value(updatePriority.value),
          // reminderId: drift.Value(reminder),
          archive: drift.Value(false));

      var data = await dbcontroller.appDB.insertHabbit(entity);
      await addCheckLists(data);
      // await addReminderNotification();
      await addReminders(data);
      await addReminderNotification(context, updateName.value);
    } catch (e) {
      log('hahaha error $e');
    }
  }

  editHabit() async {
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

  updateArchive(
      bool dt,
      int id,
      int pri,
      int reminderid,
      int catid,
      String hname,
      String eva,
      String hdes,
      DateTime startD,
      DateTime endD) async {
    await dbcontroller.appDB.updateArchive(
        dt, id, pri, reminderid, catid, hname, eva, hdes, startD, endD);
  }

  RxList<TextEditingController> habbitChecklist =
      <TextEditingController>[TextEditingController(text: '')].obs;

  addCheckLists(int taskId) async {
    try {
      await Future.forEach(
        habbitChecklist,
        (element) async {
          var entity = HabbitChecklistModelCompanion(
              rChecklistName: drift.Value(element.text),
              habbitId: drift.Value(taskId));
          var data = await dbcontroller.appDB.insertHabbitChecklist(entity);
        },
      );
      habbitChecklist.value = [TextEditingController(text: '')];
      await addReminder(taskId);
      // await addReminderNotification(taskId);
      // getTask(editIndexTemp)
      // Get.back();
    } catch (e) {
      log('hahaha error $e');
    }
  }

  addNumaric() {
    numaricStatus.value = numaricStatus.value + 1;
  }

  subNumaric() {
    if (numaricStatus.value >= 1) {
      numaricStatus.value = numaricStatus.value - 1;
    } else {}
  }

  addReminders(int taskId) async {
    try {
      await Future.forEach(
        remList,
        (element) async {
          var entity = HabitReminderModelCompanion(
            reminderTime: drift.Value(DateTime(
              DateTime.now().toLocal().year,
              DateTime.now().toLocal().month,
              DateTime.now().toLocal().day,
              element.time!.hour,
              element.time!.minute,
            )),
            type: drift.Value(element.type!),
            always: drift.Value(element.always!),
            days: drift.Value(element.days!.join('-')),
            habitId: drift.Value(taskId),
          );
          var data = await dbcontroller.appDB.insertHabitReminder(entity);

          // log(addReminderNotification(context).toString());
        },
      );
      habbitChecklist.value = [TextEditingController(text: '')];
      remId.value = 1;
      remList.value = [];
      // addReminderNotification(context);
      // getTask(editIndexTemp)
      Get.back();
    } catch (e) {
      log('hahaha error $e');
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

  RxList<HabbitChecklistModelData> checkListData =
      <HabbitChecklistModelData>[].obs;
  //  checkListData = .obs;
  Rx<DateTime> reminderTime = DateTime(0000, 00, 00, 08, 30).obs;

  var taskReminderId = 0.obs;

  RxList<ReminderModelTemp> remList = <ReminderModelTemp>[].obs;

  var remType = "notification".obs;
  var remTime = TimeOfDay.now().obs;
  var always = true.obs;
  RxList<String> remDays = <String>[].obs;
  var remId = 1.obs;
  var remEditId = 0.obs;

  addReminderToList() {
    remList.add(ReminderModelTemp(
        always: always.value,
        days: remDays.value,
        id: remId.value,
        time: remTime.value,
        type: remType.value));
    remType.value = "notification";
    remTime.value = TimeOfDay.now();
    always.value = true;
    remDays.value = [];
    remId.value = remId.value + 1;
    Get.back();
  }

  addReminderNotification(context, name) async {
    for (var i = 0; i <= remList.length; i++) {
      // print(remList.time.toString());
      print(remTime.value.minute.toString());
      NotificationHabitReminder? pickedSchedule =
          await pickHabitReminder(context, i);

      if (pickedSchedule != null) {
        habitReminderNotification(pickedSchedule, name);
      }
    }
  }

  addReminderAlarmNotification(context) async {
    for (var i = 0; i <= remList.length; i++) {
      // print(remList.time.toString());
      print(remTime.value.minute.toString());
      NotificationHabitAlarm? pickedSchedule = await pickHabitAlarm(context, i);

      if (pickedSchedule != null) {
        createHabitAlarmNotification(pickedSchedule, i);
      }
    }
  }

  editReminderToList() {
    remList[remList.indexWhere((element) => element.id == remEditId.value)] =
        ReminderModelTemp(
            always: always.value,
            days: remDays.value,
            id: remEditId.value,
            time: remTime.value,
            type: remType.value);
    // remList.add();
    remList.refresh();
    remType.value = "notification";
    remTime.value = TimeOfDay.now();
    always.value = true;
    remDays.value = [];
    remEditId.value = 0;
    Get.back();
  }

  cancelReminderToList() {
    // remList.add(ReminderModelTemp(always: always.value,days: remDays.value,id: remId.value,time: remTime.value,type: remType.value));
    remType.value = "notification";
    remTime.value = TimeOfDay.now();
    always.value = true;
    remDays.value = [];
    Get.back();
  }

  addReminder(int repetition) async {
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
      remList.value = [];
      // await addReminderNotification(repetition);
      Get.back();
      // await addHabbit(data, repetition);
    } catch (e) {
      log('hahaha error $e');
    }
  }

  var statusListOfDay = [
    DateTime.now().add(Duration(days: -6)),
    DateTime.now().add(Duration(days: -5)),
    DateTime.now().add(Duration(days: -4)),
    DateTime.now().add(Duration(days: -3)),
    DateTime.now().add(Duration(days: -2)),
    DateTime.now().add(Duration(days: -1)),
    DateTime.now(),
  ];

  RxList<HabitStatusModelData> status = <HabitStatusModelData>[].obs;

  getStatusOfHabit() {
    dbcontroller.appDB.streamHabbitStatus().forEach((element) {
      status.value = element;
      status.refresh();
    });
  }

  addStatus(int habitId, String statusP, DateTime dateP, int id, String value,
      String type, String status) async {
    var statusD = 'initial';
    var statusValue = 'false';
    switch (statusP) {
      case 'initial':
        statusD = 'success';
        statusValue = 'true';
        break;
      case 'success':
        statusD = 'cancel';
        statusValue = 'false';
        break;
      case 'cancel':
        statusValue = 'false';
        statusD = 'initial';
        break;
      default:
    }

    if (type == "YES OR NO") {
      if (id == 0) {
        var entity = HabitStatusModelCompanion(
            habitId: drift.Value(habitId),
            status: drift.Value(statusD),
            value: drift.Value(statusValue),
            type: drift.Value(type),
            date: drift.Value(dateP));
        var result = await dbcontroller.appDB.insertHabbitStatus(entity);
      } else {
        var entity = HabitStatusModelCompanion(
            statusId: drift.Value(id),
            habitId: drift.Value(habitId),
            status: drift.Value(statusD),
            value: drift.Value(statusValue),
            type: drift.Value(type),
            date: drift.Value(dateP));
        var result = await dbcontroller.appDB.updateHabbitStatus(entity);
      }
    } else if (type == "Numeric") {
      if (id == 0) {
        var entity = HabitStatusModelCompanion(
            habitId: drift.Value(habitId),
            status: drift.Value(status),
            value: drift.Value(value),
            type: drift.Value(type),
            date: drift.Value(dateP));
        var result = await dbcontroller.appDB.insertHabbitStatus(entity);
      } else {
        var entity = HabitStatusModelCompanion(
            statusId: drift.Value(id),
            habitId: drift.Value(habitId),
            status: drift.Value(statusD),
            value: drift.Value(statusValue),
            type: drift.Value(type),
            date: drift.Value(dateP));
        var result = await dbcontroller.appDB.updateHabbitStatus(entity);
      }
    } else if (type == "Timer") {
      if (id == 0) {
        var entity = HabitStatusModelCompanion(
            habitId: drift.Value(habitId),
            status: drift.Value(status),
            value: drift.Value(value),
            type: drift.Value(type),
            date: drift.Value(dateP));
        var result = await dbcontroller.appDB.insertHabbitStatus(entity);
      } else {
        var entity = HabitStatusModelCompanion(
            statusId: drift.Value(id),
            habitId: drift.Value(habitId),
            status: drift.Value(statusD),
            value: drift.Value(statusValue),
            type: drift.Value(type),
            date: drift.Value(dateP));
        var result = await dbcontroller.appDB.updateHabbitStatus(entity);
      }
    }
  }

  getColorByStatus(String status, DateTime date) {
    switch (status) {
      case 'initial':
        return checkDate(date, DateTime.now()) ? Colors.white : Colors.amber;
      case 'success':
        return Colors.green;
      case 'cancel':
        return Colors.red;
      default:
        return checkDate(date, DateTime.now()) ? Colors.white : Colors.amber;
    }
  }

  bool checkDate(DateTime a, DateTime b) {
    if (a.year == b.year && a.month == b.month && a.day == b.day) {
      return true;
    } else {
      return false;
    }
  }

  giveDay(int day) {
    switch (day) {
      case 0:
        return 'sun';
      case 1:
        return 'mon';
      case 2:
        return 'tue';
      case 3:
        return 'wed';
      case 4:
        return 'thu';
      case 5:
        return 'fri';
      case 6:
        return 'sat';
      default:
        return 'sun';
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

      await editHabit();
    } catch (e) {
      log('hahaha error ${e}');
    }
  }

  var times = 0.obs;
  var repeatTime = 0.obs;
  var repeatPeriod = ''.obs;

  var timeWeek = ''.obs;
  addRepetition(BuildContext context) async {
    try {
      var entity = RecurringRepetitionModelCompanion(
        daysMonth: drift.Value(monthIndex.join(',')),
        daysWeek: drift.Value(weekIndex.join(',')),
        repeat: drift.Value(
            '${repeatTime.value},${repeatPeriod.value},${flexible.value}'),
        specificDay: drift.Value(singleDate.value),
        timePeriod: drift.Value('${times.value},${timeWeek.value}'),
        type: drift.Value(updateRepetation.value),
      );

      var data = await dbcontroller.appDB.insertRecurringRepetition(entity);

      await addHabbit(data, context);
    } catch (e) {
      log('hahaha error $e');
    }
  }

  editRepetition() async {
    try {
      var entity = RecurringRepetitionModelCompanion(
        id: drift.Value(taskReminderId.value),
        daysMonth: drift.Value(monthIndex.join(',')),
        daysWeek: drift.Value(weekIndex.join(',')),
        repeat: drift.Value(
            '${repeatTime.value},${repeatPeriod.value},${flexible.value}'),
        specificDay: drift.Value(singleDate.value),
        timePeriod: drift.Value('${times.value},${timeWeek.value}'),
        type: drift.Value(updateRepetation.value),
      );

      var data = await dbcontroller.appDB.insertRecurringRepetition(entity);

      await editHabit();
    } catch (e) {
      log('hahaha error $e');
    }
  }

  RxList<HabbitModelData> tasks = <HabbitModelData>[].obs;

  getTasks() {
    try {
      tasks.value = [];
      dbcontroller.appDB.streamHabbits().forEach((element) {
        tasks.value = element;
        // if (switchController.todoSorting.value == 'Alphabetical') {
        //   tasks.sort(
        //     (a, b) => a.habitName.compareTo(b.habitName),
        //   );
        // } else if (switchController.todoSorting.value == 'By priority') {
        //   tasks.sort(
        //     (a, b) => b.priority.compareTo(a.priority),
        //   );
        // } else if (switchController.todoSorting.value == 'By time') {
        //   tasks.sort(
        //     (a, b) => a.endDate.compareTo(b.endDate),
        //   );
        // } else if (switchController.todoSorting.value == 'By category') {
        //   tasks.sort(
        //     (a, b) => a.categoryId.compareTo(b.categoryId),
        //   );
        // }
        // // else if (switchController.todoSorting.value == 'Habits firsts') {
        // //   tasks.sort(
        // //     (a, b) => a.habbitId..compareTo(b.habbitId),
        // //   );
        // //   tasks.refresh();
        // // }
        // else {
        //   print('hahahahahh sorting error');
        // }

        tasks.refresh();
        log("tasks ${tasks.length.toString()}");
      });
      getStatusOfHabit();
    } catch (e) {
      log('hahaha error $e');
    }
  }

  RxList<RecurringRepetitionModelData> repetitionsData =
      <RecurringRepetitionModelData>[].obs;

  getRepetitions() {
    try {
      repetitionsData.value = [];
      dbcontroller.appDB.streamRecurringRepetition().forEach((element) {
        repetitionsData.value = element;
        repetitionsData.refresh();
        log(repetitionsData.length.toString());
      });
    } catch (e) {
      log('hahaha error $e');
    }
  }

  RxList<HabbitChecklistModelData> checklists =
      <HabbitChecklistModelData>[].obs;
  getChecklistss() {
    try {
      dbcontroller.appDB.streamHabbitChecklist().forEach((element) {
        checklists.value = element;
        checklists.refresh();
        log(checklists.length.toString());
      });
    } catch (e) {
      log('hahaha error $e');
    }
  }

  RxString colorChange = 'red'.obs;

  // colorChange1() {
  //   if (colorChange.value == 'yellow') {
  //     selectColor.value = Colors.yellow;
  //   } else if (colorChange.value == 'green') {
  //     selectColor.value = Colors.green;
  //   } else if (colorChange.value == 'red') {
  //     selectColor.value = Colors.red;
  //   } else {}
  // }

  colorChangeTap() {
    if (colorChange.value == 'red') {
      colorChange.value = 'yellow';
    } else if (colorChange.value == 'yellow') {
      colorChange.value = 'green';
    } else if (colorChange.value == 'green') {
      colorChange.value = 'red';
    } else {
      print('tap error');
    }
  }

  void notifiy() {
    if (colorChange.value == "green") {
      switchController.NotifySwichChange.value == true
          ? FlutterRingtonePlayer.playNotification()
          : const SizedBox();
    }
  }

  void isVibration() async {
    if (colorChange.value == "green") {
      Vibration.vibrate();
    }
  }
}

class ReminderModelTemp {
  int? id = 0;
  TimeOfDay? time = TimeOfDay.now();
  String? type = "notification";
  bool? always = true;
  List<String>? days = <String>[];
  ReminderModelTemp(
      {this.always = true,
      this.time,
      this.days,
      this.type = "notification",
      this.id = 0});
}
