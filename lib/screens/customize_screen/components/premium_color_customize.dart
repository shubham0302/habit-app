// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';

import '../../../controllers/theme_controller.dart';
import '../../getPremium_dailbox.dart';
import '../../../theme/color_scheme.dart';
import '../../../widgets/text_widget/label_text.dart';

class PremiumColor extends StatelessWidget {
  const PremiumColor({super.key});

  @override
  Widget build(BuildContext context) {
    PremiumController premiumController =
        Get.put(PremiumController(), permanent: false);
    RxBool isClassic = false.obs;
    ThemeController themeController = Get.find<ThemeController>();
    return GlobalPadding(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(text: CScreenLabels.premiumBrightnessSubtitleText.tr),
            SH.large(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          themeController.changeThemeColor('orange');
                          print(Theme.of(context).brightness);
                        }
                        // Get.toNamed('/intro');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: themeController.mode == 'orange'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData
                                          .themeData['orange']!['primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'orange']!['primaryColor'])!
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
                                    .themeData['orange']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['orange']!['primaryColor'],
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          themeController.changeThemeColor('green');
                          print(Theme.of(context).brightness);
                          // Get.toNamed('/intro');
                        }
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
                                      : ColorSchemeData.darkThemeData['green']![
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('purple');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['purple']!['primaryColor']
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('yellow');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['yellow']!['primaryColor']
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
            SH.small(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('green');
                          print(Theme.of(context).brightness);
                        }
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
                                      : ColorSchemeData.darkThemeData['green']![
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('purple');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['purple']!['primaryColor']
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('yellow');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['yellow']!['primaryColor']
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
            SH.small(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('green');
                          print(Theme.of(context).brightness);
                        }
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
                                      : ColorSchemeData.darkThemeData['green']![
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('purple');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['purple']!['primaryColor']
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('yellow');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['yellow']!['primaryColor']
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
            SH.small(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('green');
                          print(Theme.of(context).brightness);
                        }
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
                                      : ColorSchemeData.darkThemeData['green']![
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('red');
                          print(Theme.of(context).brightness);
                        }
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
                            color:
                                Theme.of(context).brightness == Brightness.light
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('purple');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['purple']!['primaryColor']
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
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('yellow');
                          print(Theme.of(context).brightness);
                        }
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
                                      ? ColorSchemeData
                                          .themeData['yellow']!['primaryColor']
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
            )
          ],
        ),
      ),
    );
  }
}
