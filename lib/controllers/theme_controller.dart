import 'package:get/get.dart';

class ThemeController extends GetxController{
  RxBool _isDark = false.obs;
  RxString _mode = 'red'.obs;

  bool get isDark => _isDark.value;
  String get mode => _mode.value;

  changeThemeMode(){
    _isDark.value = !_isDark.value;
  }
  changeThemeColor(String val){
    if(_mode.value != val){
      _mode.value = val;
    }
  }
}