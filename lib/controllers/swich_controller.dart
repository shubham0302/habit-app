// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:habbit_app/screens/helpers/local_storage_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
