import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:habbit_app/helpers/local_storage_helper.dart';

class PremiumController extends GetxController {
  RxBool premium = false.obs;
  var user = FirebaseAuth.instance.currentUser.obs;

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

  void refreshUser() {
    user.value = FirebaseAuth.instance.currentUser;
  }

  @override
  void onInit() {
    getFromLocal();
    super.onInit();
  }
}
