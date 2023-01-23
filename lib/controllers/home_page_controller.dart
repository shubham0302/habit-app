// ignore_for_file: unnecessary_overrides, non_constant_identifier_names

import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt SelectedDateIndex = 0.obs;

  RxString habbitComplete = ''.obs;

  var tabIndex = 0.obs;
  var selectedDay = DateTime.now();

  void changeTabIndex(int index) async {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
