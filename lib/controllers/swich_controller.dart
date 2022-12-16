import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class SwitchController extends GetxController {
  RxBool SwichChange = true.obs;
  RxBool CollapseSwichChange = true.obs;
  RxBool SwipSwichChange = true.obs;
  RxBool AnimationSwichChange = true.obs;
  RxBool AwardsSwichChange = true.obs;
  RxBool NotifySwichChange = true.obs;
  RxBool RemindSwichChange = true.obs;
  RxBool LockPinSwichChange = true.obs;
  RxBool FingerSwichChange = true.obs;
}
