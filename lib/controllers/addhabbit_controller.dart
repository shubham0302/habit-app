// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:drift/drift.dart' as drift;
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:vibration/vibration.dart';

import '../infrastructure/db/app_service.dart';

class AddHabbitSelectController extends GetxController {
  DBController dbcontroller = Get.find<DBController>();
  SwitchController switchController =
      Get.put(SwitchController(), permanent: false);
  // AddHabbitSelectController habbitSelectController =
  //     Get.put(AddHabbitSelectController(), permanent: true);
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
  // RxList<int> habitStatus = <int>[].obs;
  RxString habitStatus = 'pending'.obs;
  Rx<Icon> categoryIcon = const Icon(
    Icons.checklist,
  ).obs;
  RxBool isArcive = false.obs;
  RxString updateRepetation = "Everyday".obs;
  RxInt updatePriority = 0.obs;
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

  addHabbit(int reminder, int repetition) async {
    try {
      var entity = HabbitModelCompanion(
          repetitonId: drift.Value(repetition),
          // repetition: drift.Value(updateRepetation.value),
          habitName: drift.Value(updateName.value),
          categoryId: drift.Value(categoryId.value == 0 ? 1 : categoryId.value),
          startDate: drift.Value(startDate.value),
          endDate: drift.Value(endDate.value),
          evaluate: drift.Value(selectEvaluate.value),
          habbitDescription: drift.Value(updateDescription.value),
          priority: drift.Value(updatePriority.value),
          reminderId: drift.Value(reminder),
          archive: drift.Value(false));

      var data = await dbController.appDB.insertHabbit(entity);

      await addCheckLists(data);
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
    await dbController.appDB.updateArchive(
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
          var data = await dbController.appDB.insertHabbitChecklist(entity);
        },
      );
      habbitChecklist.value = [TextEditingController(text: '')];

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

      await addHabbit(data, repetition);
    } catch (e) {
      log('hahaha error $e');
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
  addRepetition() async {
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

      var data = await dbController.appDB.insertRecurringRepetition(entity);

      await addReminder(data);
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

      var data = await dbController.appDB.insertRecurringRepetition(entity);

      await editHabit();
    } catch (e) {
      log('hahaha error $e');
    }
  }

  RxList<HabbitModelData> tasks = <HabbitModelData>[].obs;

  getTasks() {
    try {
      tasks.value = [];
      dbController.appDB.streamHabbits().forEach((element) {
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
    } catch (e) {
      log('hahaha error $e');
    }
  }

  RxList<RecurringRepetitionModelData> repetitionsData =
      <RecurringRepetitionModelData>[].obs;

  getRepetitions() {
    try {
      repetitionsData.value = [];
      dbController.appDB.streamRecurringRepetition().forEach((element) {
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
      dbController.appDB.streamHabbitChecklist().forEach((element) {
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
