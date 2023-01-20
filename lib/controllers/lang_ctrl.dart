import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/helpers/local_storage_helper.dart';
// import 'package:intl/locale.dart';

class LanguageController extends GetxController {
  List locale = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
    {'name': 'española', 'locale': const Locale('es', 'ES')},
    {'name': 'Português', 'locale': const Locale('pt', 'PT')},
    {'name': 'Deutsch', 'locale': const Locale('de', 'DE')},
    {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
    {'name': 'Français', 'locale': const Locale('fr', 'FR')},
    {'name': '한국어', 'locale': const Locale('ko', 'KO')},
    {'name': '日本語', 'locale': const Locale('ja', 'JA')},
  ];
  updateLanguage(Locale localeData, String name) async {
    await LocalStorageHelper.setItem('lang', name);
    Get.updateLocale(localeData);
    Get.back();
  }

  getLanguage() async {
    var lang = await LocalStorageHelper.getItem('lang');
    if (lang != null) {
      var data = locale.firstWhere((element) => element['name'] == lang);
      await LocalStorageHelper.setItem('lang', data['name']);
      Get.updateLocale(data['locale']);
      // await

    }
    // Get.back();
  }

  @override
  void onInit() {
    getLanguage();

    super.onInit();
  }
}
