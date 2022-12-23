import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHabbitSelectController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
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
  RxBool alwaysenabled = true.obs;
  RxList<String> customDays = <String>[].obs;
  RxBool sun = true.obs;
  RxBool mon = true.obs;
  RxBool tus = true.obs;
  RxBool wed = true.obs;
  RxBool thu = true.obs;
  RxBool fri = true.obs;
  RxBool sat = true.obs;
  RxBool customSound = true.obs;
  RxBool customVibration = true.obs;
  RxBool customAlarm = true.obs;
}
