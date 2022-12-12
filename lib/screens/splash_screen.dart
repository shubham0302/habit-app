import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/theme/color_scheme.dart';
import 'package:habbit_app/widgets/text_widget/button_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();
    ThemeData color = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(
          text: 'Plannarize',
        ),
        backgroundColor: color.indicatorColor,
      ),
      backgroundColor: color.backgroundColor,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      themeController.changeThemeMode();
                      // Get.toNamed('/intro');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color:
                          themeController.isDark ? Colors.white : Colors.black,
                      child: Icon(
                        Icons.brightness_1,
                        color: themeController.isDark
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      themeController.changeThemeColor('red');
                      // Get.toNamed('/intro');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: !themeController.isDark
                          ? ColorSchemeData.themeData['red']!['primaryColor']
                          : ColorSchemeData
                              .darkThemeData['red']!['primaryColor'],
                      child: const Icon(Icons.arrow_forward_ios_rounded),
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
                      height: 50,
                      width: 50,
                      color: !themeController.isDark
                          ? ColorSchemeData.themeData['green']!['primaryColor']
                          : ColorSchemeData
                              .darkThemeData['green']!['primaryColor'],
                      child: const Icon(Icons.arrow_forward_ios_rounded),
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
                      height: 50,
                      width: 50,
                      color: !themeController.isDark
                          ? ColorSchemeData.themeData['purple']!['primaryColor']
                          : ColorSchemeData
                              .darkThemeData['purple']!['primaryColor'],
                      child: const Icon(Icons.arrow_forward_ios_rounded),
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
                      height: 50,
                      width: 50,
                      color: !themeController.isDark
                          ? ColorSchemeData.themeData['blue']!['primaryColor']
                          : ColorSchemeData
                              .darkThemeData['blue']!['primaryColor'],
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      // themeController.changeThemeColor('blue');
                      Get.toNamed('/customize');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: !themeController.isDark
                          ? ColorSchemeData.themeData['blue']!['primaryColor']
                          : ColorSchemeData
                              .darkThemeData['blue']!['primaryColor'],
                      child: const Icon(Icons.skip_next),
                    ),
                  ),
                ),
              ],
            ),
            const HeadingText(text: "Heading"),
            const LabelText(text: 'Label'),
            const MainLabelText(text: 'MainLabel'),
            const DescriptionText(text: 'Description'),
            const TitleText(text: 'Title'),
            const ButtonText(text: 'Button')
          ],
        ),
      ),
    );
  }
}
