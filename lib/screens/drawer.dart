import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:habbit_app/auth_path.dart';
import 'package:habbit_app/screens/contactUS/contact_custom_dailog.dart';
import 'package:habbit_app/screens/rate_us/rate_us_dailbox.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';
import '../controllers/email_send_controller.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentDateformate =
        DateFormat('${now.day}-${now.month}-${now.year}').format(now);
    String currentDayFormate = DateFormat('EEEE').format(now);
    ThemeData color = Theme.of(context);
    EmailSendController emailSendController =
        Get.put(EmailSendController(), permanent: false);

    return Drawer(
      width: MediaQuery.of(context).size.width * .7,
      backgroundColor: color.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(
                    text: 'plannarize'.tr,
                    color: color.primaryColor,
                    isColor: true,
                  ),
                  SH.small(),
                  Row(
                    children: [
                      LabelText(text: currentDateformate),
                      SW.medium(),
                      LabelText(
                        text: currentDayFormate,
                        isNormal: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SH.large(),
            // const Divider(),
            SH.large(),
            InkWell(
              onTap: () {
                Vibration.vibrate(duration: 1000);
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color.disabledColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: color.primaryColor,
                      size: 25,
                    ),
                    SW.large(),
                    LabelText(
                      text: 'Home'.tr,
                      color: color.primaryColor,
                      isColor: true,
                    ),
                  ],
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Get.toNamed("/timer");
            //   },
            //   customBorder: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(21),
            //   ),
            //   child: Container(
            //     height: 45,
            //     padding: const EdgeInsets.only(left: 21),
            //     alignment: Alignment.centerLeft,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         // color: color.disabledColor,
            //         borderRadius: BorderRadius.circular(25)),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.timer_outlined,
            //           size: 25,
            //           // color: color.disabledColor,
            //           color: color.disabledColor,
            //         ),
            //         SW.large(),
            //         LabelText(
            //           text: 'Timer'.tr,
            //           isColor: true,
            //           color: color.disabledColor,
            //           // color: color.hoverColor,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Get.toNamed('/categoriesdrawer');
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.category_outlined,
                      size: 25,
                      color: color.disabledColor,
                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      text: 'Categories'.tr,
                      isColor: true,
                      color: color.disabledColor,
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            // SH.large(),
            SH.small(),

            const Divider(),
            SH.small(),

            // SH.large(),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                Get.toNamed("/customize");
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard_customize_outlined,
                      size: 25,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      text: 'Customize'.tr,
                      isColor: true,
                      color: color.disabledColor,
                      // color: color.hover
                      // Color,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                Get.toNamed('/setting');
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 25,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      text: 'Settings'.tr,

                      isColor: true,
                      color: color.disabledColor,
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                Get.toNamed('/backup');
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.backup_outlined,
                      size: 25,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      text: 'Backups'.tr,
                      isColor: true,
                      color: color.disabledColor,
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            // SH.large(),
            SH.small(),

            const Divider(),
            SH.small(),
            // SH.large(),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                Get.toNamed("/getpremium");
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified_outlined,
                      size: 25,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      isColor: true,
                      color: color.disabledColor,
                      text: 'Get Premium'.tr,
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                RateUsCustomDialogBox(context);
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 25,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      isColor: true,
                      color: color.disabledColor,
                      text: 'Rate this app'.tr,
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                // Get.to(AuthPath());
                ContactCustomDialogBox(context);
                emailSendController.controllerMessage.clear();
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.contact_page_outlined,
                      size: 25,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    LabelText(
                      isColor: true,
                      color: color.disabledColor,
                      text: 'Contact us'.tr,
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
