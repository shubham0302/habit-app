import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/theme/color_scheme.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          themeController.changeThemeColor('red');
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: !themeController.isDark
                                ? ColorSchemeData
                                    .themeData['red']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['red']!['primaryColor'],
                          ),
                          // child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          themeController.changeThemeColor('green');
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: !themeController.isDark
                                ? ColorSchemeData
                                    .themeData['green']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['green']!['primaryColor'],
                          ),
                          // child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          themeController.changeThemeColor('purple');
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: !themeController.isDark
                                ? ColorSchemeData
                                    .themeData['purple']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['purple']!['primaryColor'],
                          ),
                          // child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          themeController.changeThemeColor('blue');
                          // Get.toNamed('/intro');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: !themeController.isDark
                                ? ColorSchemeData
                                    .themeData['blue']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['blue']!['primaryColor'],
                          ),
                          // child: Icon(Icons.arrow_forward_ios_rounded),
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
