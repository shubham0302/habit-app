import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LockPinController extends GetxController {
  TextEditingController pinCtrl = TextEditingController();
  RxString pin = "".obs;
  TextEditingController pinconfirmCtrl = TextEditingController();
  RxString confirmpin = "".obs;
}
