import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:habbit_app/helpers/local_storage_helper.dart';

class PremiumController extends GetxController {
  RxBool premium = false.obs;

  setPremium() async {
    await LocalStorageHelper.setItem('premium', premium.value.toString());
  }

  getFromLocal() async {
    var premiumFeature = await LocalStorageHelper.getItem('premium');

    if (premiumFeature == 'false') {
      premium.value = false;
    } else {
      premium.value = true;
    }
  }

  @override
  void onInit() {
    getFromLocal();
    super.onInit();
  }
}
