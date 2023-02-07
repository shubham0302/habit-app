// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/backup_screen.dart';
import 'package:habbit_app/services/firebase_services.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void BackupLogoutCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: color.backgroundColor,
                  content: Container(
                    // width: 300,
                    // height: 180,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LabelText(
                              text:
                                  'To change account you have to log out first. Proceed?'),
                          SH.large(),
                          Divider(),
                          SH.large(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: LabelText(text: 'CANCEL')),
                              GestureDetector(
                                onTap: () async {
                                  await FirerbaseServices().logOut();
                                  Get.back();
                                },
                                child: LabelText(
                                  text: 'YES',
                                  isColor: true,
                                ),
                              )
                            ],
                          )
                        ]),
                  ))),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
