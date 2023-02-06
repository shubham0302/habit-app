// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';

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
            LabelText(text: CScreenLabels.freeColorTitleText.tr),
            GlobalPadding(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('free1');
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
                                color: themeController.mode == 'free1'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['free1']!['primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'free1']!['primaryColor'])!
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
                                      .themeData['free1']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['free1']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SW.small(),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('free2');
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
                                color: themeController.mode == 'free2'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['free2']!['primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'free2']!['primaryColor'])!
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
                                      .themeData['free2']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['free2']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SW.small(),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('free3');
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
                                color: themeController.mode == 'free3'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['free3']!['primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'free3']!['primaryColor'])!
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
                                      .themeData['free3']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['free3']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    SW.small(),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          themeController.changeThemeColor('free4');
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
                                color: themeController.mode == 'free4'
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? ColorSchemeData
                                            .themeData['free4']!['primaryColor']
                                        : ColorSchemeData.darkThemeData[
                                            'free4']!['primaryColor'])!
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
                                      .themeData['free4']!['primaryColor']
                                  : ColorSchemeData
                                      .darkThemeData['free4']!['primaryColor'],
                            ),
                            // child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    // Center(
                    //   child: InkWell(
                    //     borderRadius: BorderRadius.circular(50),
                    //     onTap: () {
                    //       themeController.changeThemeColor('yellow');
                    //       print(Theme.of(context).brightness);
                    //       // Get.toNamed('/intro');
                    //     },
                    //     child: Container(
                    //       padding: const EdgeInsets.all(2),
                    //       height: 44,
                    //       width: 44,
                    //       decoration: BoxDecoration(
                    //           border: Border.all(
                    //             width: 2,
                    //             color: themeController.mode == 'yellow'
                    //                 ? (Theme.of(context).brightness ==
                    //                         Brightness.light
                    //                     ? ColorSchemeData.themeData['yellow']![
                    //                         'primaryColor']
                    //                     : ColorSchemeData.darkThemeData[
                    //                         'yellow']!['primaryColor'])!
                    //                 : Colors.transparent,
                    //           ),
                    //           borderRadius: BorderRadius.circular(22)),
                    //       child: Container(
                    //         height: 40,
                    //         width: 40,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(25),
                    //           color: Theme.of(context).brightness ==
                    //                   Brightness.light
                    //               ? ColorSchemeData
                    //                   .themeData['yellow']!['primaryColor']
                    //               : ColorSchemeData
                    //                   .darkThemeData['yellow']!['primaryColor'],
                    //         ),
                    //         // child: Icon(Icons.arrow_forward_ios_rounded),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
