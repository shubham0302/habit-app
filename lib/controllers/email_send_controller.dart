import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSendController extends GetxController {
  String controllerTo = "dhruvinkansagra5@gmail.com";
  String controllerSubject = 'Contact support - HabitApp v0.0.1';
  String controllerSubjectSuggestions = 'Feedback - HabitApp v0.0.1';
  String controllerSubjectBug = 'Bug report - HabitApp v0.0.1';
  final controllerMessage = TextEditingController();
}
