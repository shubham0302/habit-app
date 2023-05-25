// ignore_for_file: file_names, unused_local_variable, depend_on_referenced_packages, sized_box_for_whitespace, use_build_context_synchronously, deprecated_member_use, unnecessary_null_comparison

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/helpers/local_storage_helper.dart';
import 'package:habbit_app/infrastructure/db/app_service.dart';
import 'package:habbit_app/screens/backup_logout_dailog.dart';
import 'package:habbit_app/screens/intro_screen.dart';
import 'package:habbit_app/services/firebase_services.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

import '../controllers/premium_controller.dart';
import 'getPremium_dailbox.dart';

class BackUpScreen extends StatelessWidget {
  const BackUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PremiumController premiumController =
        Get.put(PremiumController(), permanent: false);
    DBController dbController = Get.find<DBController>();

    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    // bool status = true;
    ThemeData color = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    ThemeController themeController = Get.find<ThemeController>();
    PageCntrl pageCntrl = Get.put(PageCntrl());
    return Scaffold(
      body: SafeArea(
        child: GlobalPadding(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (() {
                          Get.back();
                        }),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: color.primaryColorLight,
                          ),
                        )),
                    SW.medium(),
                    MainLabelText(text: 'Backups'.tr),
                  ],
                ),
                // Icon(
                //   Icons.brush,
                //   size: 20,
                //   color: color.backgroundColor,
                // ),
              ],
            ),
            SH.large(),
            SH.large(),
            SH.large(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (premiumController.user.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'To take the back-up you need to add cloud backup account',
                          ),
                        ),
                      );
                    } else {
                      FilePickerResult? backUpFile =
                          await FilePicker.platform.pickFiles();
                      if (!(backUpFile!.files.single.path!
                          .contains('.sqlite'))) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'File not supported please select valid file')));
                      } else if (backUpFile != null) {
                        File? file = File(backUpFile.files.single.path!);
                        bool uploaded =
                            await FirerbaseServices().saveBackUpToTheFirebase(
                          fileName: 'habbit_app_database.sqlite',
                          backupFile: file,
                        );
                        if (uploaded) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Backup taken successfully')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Something went wrong while taking the back-up, Please try after some time')));
                        }
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: color.disabledColor.withOpacity(.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.backup,
                          size: 50,
                          color: color.primaryColorLight,
                        ),
                        // SH.small(),
                        LabelText(
                          text: "Upload Backup".tr,
                          isBold: true,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (premiumController.user.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'To import the backup you need to sign-in into your cloud backup account',
                          ),
                        ),
                      );
                    } else {
                      showImportBackupAlert(
                        context: context,
                        dbController: dbController,
                        yesImport: () async{
                          bool downloaded =
                          await FirerbaseServices().getBackUpFromTheFirebase();
                          if (downloaded) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Imported back-up successfully, If you still don\'t see updates,Please restart the app',
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Something went wrong while getting the backup',
                                ),
                              ),
                            );
                          }
                        }
                      );
                    }
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: color.disabledColor.withOpacity(.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_download,
                          size: 50,
                          color: color.primaryColorLight,
                        ),
                        // SH.small(),
                        LabelText(
                          alignment: TextAlign.center,
                          text: "Import from cloud".tr,
                          isBold: true,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SH.large(),
            SH.large(),
            const Divider(
              thickness: 0.5,
            ),
            SH.large(),
            SH.large(),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: color.primaryColor,
                  size: 20,
                ),
                SW.medium(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(
                      text: "Cloud Backups Account".tr,
                    ),
                    premiumController.premium.value == false
                        ? const DescriptionText(
                            text: 'Only for premium users',
                            isColor: true,
                          )
                        : const SizedBox()
                  ],
                ),
                SW.medium(),
                Expanded(
                    child: GestureDetector(
                  onTap: () async {
                    if (premiumController.user.value == null) {
                      await FirerbaseServices()
                          .signInWithGoggle(context: context);
                      premiumController.refreshUser();
                      // Get.to(HomePage());
                    } else {
                      BackupLogoutCustomDialogBox(context);
                    }
                  },
                  child: Container(
                      alignment: Alignment.centerLeft,
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: color.disabledColor.withOpacity(.3)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Obx(
                          () => LabelText(
                            text: premiumController.user.value == null
                                ? "Click to sing in"
                                : premiumController.user.value!.email
                                    .toString(),
                          ),
                        ),
                      )),
                ))
              ],
            ),
            SH.large(),
            // SH.medium(),
            // SH.small(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.update,
                      color: color.primaryColor,
                      size: 20,
                    ),
                    SW.medium(),
                    LabelText(
                      text: "Automatic Cloud Backups".tr,
                    ),
                  ],
                ),
                Expanded(
                  child: Obx(
                    () => FlutterSwitch(
                      activeColor: color.primaryColor,
                      activeToggleColor: color.backgroundColor,

                      width: 50.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 20.0,
                      value: switchController.SwichChange.value,
                      borderRadius: 30.0,
                      padding: 2.0,
                      // showOnOff: true,
                      onToggle: (val) {
                        if (premiumController.premium.value == false) {
                          GetPremiumCustomDialogBox(context);
                        } else {
                          switchController.SwichChange.value == true
                              ? switchController.SwichChange.value = false
                              : switchController.SwichChange.value = true;
                        }
                        // status = val;
                        // setState(() {
                        //   status = val;
                        // });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SH.large(),
            SH.large(),
            const Divider(
              thickness: 0.5,
            ),
            SH.large(),

            SH.large(),

            GestureDetector(
              onTap: () async {
                var pathOfTheLocalStorage =
                    await LocalStorageHelper.getStoredPathOfTheDatabase();
                if (pathOfTheLocalStorage != null ||
                    pathOfTheLocalStorage!.isNotEmpty) {
                  // dbController.appDB.exportInto(pathOfTheLocalStorage);
                  await createBackupAndDuplicate(pathOfTheLocalStorage);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Backup successful')));
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.file_present_rounded,
                    color: color.primaryColor,
                    size: 20,
                  ),
                  SW.medium(),
                  LabelText(
                    text: "Create Backup File".tr,
                  ),
                ],
              ),
            ),

            SH.large(),

            GestureDetector(
              onTap: () {
                showImportBackupAlert(
                  context: context,
                  dbController: dbController,
                  yesImport: () async {
                    await dbController.appDB.importDB();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Successfully imported, If you do not see the previous data, Please restart the app'),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.data_saver_off_outlined,
                    color: color.primaryColor,
                    size: 20,
                  ),
                  SW.medium(),
                  LabelText(
                    text: "Import Backup File".tr,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // Function to display the alert box for import database
  void showImportBackupAlert({
    required BuildContext context,
    required DBController dbController,
    required void  Function()? yesImport,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const HeadingText(text: 'Import Backup'),
          content: const LabelText(
              text:
                  'Are you sure you want to import the backup? If yes, your current changes will be lost.'),
          actions: [
            TextButton(
              onPressed: yesImport,
              child: const LabelText(text: 'Yes, import it anyways'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const LabelText(text: 'No, don\'t import'),
            ),
          ],
        );
      },
    );
  }
}
