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
                          themeController.changeThemeColor('premium1');
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
                              color: themeController.mode == 'premium1'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium1']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium1']!['primaryColor'])!
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
                                    .themeData['premium1']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium1']!['primaryColor'],
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
                          themeController.changeThemeColor('premium2');
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
                              color: themeController.mode == 'premium2'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium2']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium2']!['primaryColor'])!
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
                                    .themeData['premium2']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium2']!['primaryColor'],
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
                          themeController.changeThemeColor('premium3');
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
                              color: themeController.mode == 'premium3'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium3']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium3']!['primaryColor'])!
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
                                    .themeData['premium3']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium3']!['primaryColor'],
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
                          themeController.changeThemeColor('premium4');
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
                              color: themeController.mode == 'premium4'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium4']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium4']!['primaryColor'])!
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
                                    .themeData['premium4']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium4']!['primaryColor'],
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
                          themeController.changeThemeColor('premium5');
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
                              color: themeController.mode == 'premium5'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium5']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium5']!['primaryColor'])!
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
                                    .themeData['premium5']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium5']!['primaryColor'],
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
                          themeController.changeThemeColor('premium6');
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
                              color: themeController.mode == 'premium6'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium6']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium6']!['primaryColor'])!
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
                                    .themeData['premium6']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium6']!['primaryColor'],
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
                          themeController.changeThemeColor('premium7');
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
                              color: themeController.mode == 'premium7'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium7']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium7']!['primaryColor'])!
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
                                    .themeData['premium7']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium7']!['primaryColor'],
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
                          themeController.changeThemeColor('premium8');
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
                              color: themeController.mode == 'premium8'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium8']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium8']!['primaryColor'])!
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
                                    .themeData['premium8']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium8']!['primaryColor'],
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
                          themeController.changeThemeColor('premium9');
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
                              color: themeController.mode == 'premium9'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium9']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium9']!['primaryColor'])!
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
                                    .themeData['premium9']!['primaryColor']
                                : ColorSchemeData
                                    .darkThemeData['premium9']!['primaryColor'],
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
                          themeController.changeThemeColor('premium10');
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
                              color: themeController.mode == 'premium10'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium10']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium10']!['primaryColor'])!
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
                                        .themeData['premium10']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium10']!['primaryColor'],
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
                          themeController.changeThemeColor('premium11');
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
                              color: themeController.mode == 'premium11'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium11']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium11']!['primaryColor'])!
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
                                        .themeData['premium11']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium11']!['primaryColor'],
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
                          themeController.changeThemeColor('premium12');
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
                              color: themeController.mode == 'premium12'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium12']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium12']!['primaryColor'])!
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
                                        .themeData['premium12']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium12']!['primaryColor'],
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
                          themeController.changeThemeColor('premium13');
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
                              color: themeController.mode == 'premium13'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium13']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium13']!['primaryColor'])!
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
                                        .themeData['premium13']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium13']!['primaryColor'],
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
                          themeController.changeThemeColor('premium14');
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
                              color: themeController.mode == 'premium14'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium14']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium14']!['primaryColor'])!
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
                                        .themeData['premium14']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium14']!['primaryColor'],
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
                          themeController.changeThemeColor('premium15');
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
                              color: themeController.mode == 'premium15'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium15']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium15']!['primaryColor'])!
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
                                        .themeData['premium15']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium15']!['primaryColor'],
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
                          themeController.changeThemeColor('premium16');
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
                              color: themeController.mode == 'premium16'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium16']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium16']!['primaryColor'])!
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
                                        .themeData['premium16']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium16']!['primaryColor'],
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
                          themeController.changeThemeColor('premium17');
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
                              color: themeController.mode == 'premium17'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium17']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium17']!['primaryColor'])!
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
                                        .themeData['premium17']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium17']!['primaryColor'],
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
                          themeController.changeThemeColor('premium18');
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
                              color: themeController.mode == 'premium18'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium18']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium18']!['primaryColor'])!
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
                                        .themeData['premium18']!['primaryColor']
                                    : ColorSchemeData.darkThemeData[
                                        'premium18']!['primaryColor'],
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
                          themeController.changeThemeColor('premium19');
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
                              color: themeController.mode == 'premium19'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium19']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium19']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium19']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium19']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium19']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium19']![
                                      'primaryColor'],
                            ),
                          ),
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
                          themeController.changeThemeColor('premium20');
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
                              color: themeController.mode == 'premium20'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium20']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium20']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium20']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium20']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium20']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium20']![
                                      'primaryColor'],
                            ),
                          ),
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
                          themeController.changeThemeColor('premium21');
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
                              color: themeController.mode == 'premium21'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium21']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium21']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium21']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium21']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium21']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium21']![
                                      'primaryColor'],
                            ),
                          ),
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
                          themeController.changeThemeColor('premium22');
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
                              color: themeController.mode == 'premium22'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium22']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium22']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium22']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium22']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium22']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium22']![
                                      'primaryColor'],
                            ),
                          ),
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
                          themeController.changeThemeColor('premium23');
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
                              color: themeController.mode == 'premium23'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium23']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium23']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium23']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium23']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium23']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium23']![
                                      'primaryColor'],
                            ),
                          ),
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
                          themeController.changeThemeColor('premium24');
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
                              color: themeController.mode == 'premium24'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium24']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium24']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium24']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium24']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium24']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium24']![
                                      'primaryColor'],
                            ),
                          ),
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
                          themeController.changeThemeColor('premium25');
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
                              color: themeController.mode == 'premium25'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium25']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium25']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium25']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium25']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium25']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium25']![
                                      'primaryColor'],
                            ),
                          ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('premium26');
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
                              color: themeController.mode == 'premium26'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium26']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium26']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium26']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium26']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium26']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium26']![
                                      'primaryColor'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SW.small(),
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          // themeController.changeThemeMode();
                          themeController.changeThemeColor('premium27');
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
                              color: themeController.mode == 'premium27'
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorSchemeData.themeData['premium27']![
                                          'primaryColor']
                                      : ColorSchemeData.darkThemeData[
                                          'premium27']!['primaryColor'])!
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(22)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorSchemeData
                                        .themeData['premium27']!['lightPrimary']
                                    : ColorSchemeData.darkThemeData[
                                        'premium27']!['lightPrimary'],
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorSchemeData
                                      .themeData['premium27']!['primaryColor']
                                  : ColorSchemeData.darkThemeData['premium27']![
                                      'primaryColor'],
                            ),
                          ),
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
