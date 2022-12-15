// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/widgets/padding.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/color_scheme.dart';
import '../../../widgets/text_widget/label_text.dart';

class FreeColor extends StatelessWidget {
  const FreeColor({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isClassic = false.obs;
    ThemeController themeController = Get.find<ThemeController>();
    return GlobalPadding(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelText(text: CScreenLabels.freeColorTitleText),
            GlobalPadding(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: themeController.mode == 'red'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['red']!['primaryColor']
                                        : ColorSchemeData.darkThemeData['red']![
                                            'primaryColor'])!
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['red']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['red']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('green');
                          print(Theme.of(context).brightness);
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: themeController.mode == 'green'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['green']!['primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'green']!['primaryColor'])!
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['green']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['green']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('blue');
                          print(Theme.of(context).brightness);
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: themeController.mode == 'blue'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['blue']!['primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'blue']!['primaryColor'])!
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['blue']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['blue']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('purple');
                          print(Theme.of(context).brightness);
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: themeController.mode == 'purple'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData.themeData['purple']![
                                            'primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'purple']!['primaryColor'])!
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['purple']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['purple']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('yellow');
                          print(Theme.of(context).brightness);
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: themeController.mode == 'yellow'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData.themeData['yellow']![
                                            'primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'yellow']!['primaryColor'])!
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['yellow']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['yellow']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
