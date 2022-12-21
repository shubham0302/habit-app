import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHabbitSelectController extends GetxController {
  Rx<DateTime> startDate = DateTime(2022, 12, 20).obs;
  Rx<DateTime> endDate = DateTime(2022, 12, 20).obs;
  RxString updateCategory = "Select".obs;
  Rx<Icon> categoryIcon = const Icon(
    Icons.checklist,
  ).obs;
  RxString updateRepetation = "Everyday".obs;
  RxString updateReminder = "0".obs;
}
