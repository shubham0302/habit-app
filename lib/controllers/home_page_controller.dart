// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class HomePageController extends GetxController {
    RxInt SelectedDateIndex = 0.obs;

  var tabIndex = 0.obs;

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
