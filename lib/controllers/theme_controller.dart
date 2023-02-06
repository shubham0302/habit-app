// ignore_for_file: prefer_final_fields, invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/helpers/local_storage_helper.dart';

class ThemeController extends GetxController {
  RxBool _isDark = false.obs;
  var _themeModeData = CScreenLabels.oprionsForBrightness[0].obs;
  RxString _mode = 'free1'.obs;

  bool get isDark => _isDark.value;
  String get mode => _mode.value;
  Map<String, String> get themeModeData => _themeModeData.value;

  changeThemeMode() {
    _isDark.value = !_isDark.value;
  }

  changeThemeModeBy(Map<String, String> val) async {
    _themeModeData.value = val;
    await LocalStorageHelper.setItem('theme', val['value'].toString());
  }

  changeThemeColor(String val) {
    if (_mode.value != val) {
      _mode.value = val;
    }
  }

  setStoredData() async {
    try {
      String? themeMode = await LocalStorageHelper.getItem("theme");

      var dta = CScreenLabels.oprionsForBrightness
          .firstWhere((element) => element['value'] == (themeMode ?? 'light'));

      await changeThemeModeBy(dta);
    } catch (e) {
      await changeThemeModeBy(CScreenLabels.oprionsForBrightness[0]);
    }
  }

  @override
  void onInit() {
    setStoredData();
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }
}
