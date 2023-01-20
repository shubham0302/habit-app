// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/lang_ctrl.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void LanguageCustomDialogBox(BuildContext context) {
  // final List locale = [
  //   {'name': 'English', 'locale': const Locale('en', 'US')},
  //   {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
  //   {'name': 'española', 'locale': const Locale('es', 'ES')},
  //   {'name': 'Português', 'locale': const Locale('pt', 'PT')},
  //   {'name': 'Deutsch', 'locale': const Locale('de', 'DE')},
  //   {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
  //   {'name': 'Français', 'locale': const Locale('fr', 'FR')},
  //   {'name': '한국어', 'locale': const Locale('ko', 'KO')},
  //   {'name': '日本語', 'locale': const Locale('ja', 'JA')},
  // ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        LanguageController languageController = Get.find<LanguageController>();
        // CategoryController categoryController =
        //     Get.put(CategoryController(), permanent: false);
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 360,
            height: 480,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: LabelText(
                      text: "Check it daily".tr,
                      isColor: true,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                print(languageController.locale[index]['name']);
                                languageController.updateLanguage(
                                    languageController.locale[index]['locale'],
                                    languageController.locale[index]['name']);
                              },
                              child: LabelText(
                                  text: languageController.locale[index]
                                      ['name']));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: languageController.locale.length),
                  )
                  // SH.large(),
                  // Divider(),
                  // SH.large(),
                  // GestureDetector(child: LabelText(text: "English")),
                  // SH.large(),
                  // Divider(),
                  // SH.large(),
                  // GestureDetector(
                  //     onTap: () {
                  //       var locale = Locale("hi", "IN");
                  //       Get.updateLocale(locale);
                  //     },
                  //     child: LabelText(text: "Hindi")),
                  // SH.large(),
                  // LabelText(text: "Kannada"),
                  // SH.large(),
                  // LabelText(text: "Hindi"),
                  // SH.large(),
                ]),
          ),
        );
      });
}
