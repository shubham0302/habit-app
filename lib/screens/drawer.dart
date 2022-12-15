import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/customize_screen/components/custom_dialog_box.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

import '../widgets/text_widget/main_label_text.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);

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
                    text: 'Plannarize',
                    color: color.primaryColor,
                    isColor: true,
                  ),
                  SH.small(),
                  Row(
                    children: [
                      const LabelText(text: '20 SEP 2022'),
                      SW.large(),
                      const LabelText(
                        text: 'THURSDAY',
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
              onTap: () {},
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color.disabledColor.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: color.primaryColor,
                      size: 30,
                    ),
                    SW.large(),
                    MainLabelText(
                      text: 'Home',
                      color: color.primaryColor,
                      isColor: true,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
                child: GestureDetector(
                  onTap: () {
                    CustomDialogBox(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 30,
                        // color: color.disabledColor,
                        color: color.disabledColor,
                      ),
                      SW.large(),
                      MainLabelText(
                        text: 'Timer',
                        isColor: true,
                        color: color.disabledColor,
                        // color: color.hoverColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
                      Icons.category,
                      size: 30,
                      color: color.disabledColor,
                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    MainLabelText(
                      text: 'Categories',
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
              onTap: () {},
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/customize");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.dashboard_customize,
                        size: 30,
                        color: color.disabledColor,

                        // color: color.hoverColor,
                      ),
                      SW.large(),
                      MainLabelText(
                        text: 'Customize',
                        isColor: true,
                        color: color.disabledColor,
                        // color: color.hover
                        // Color,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {},
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
                      Icons.settings,
                      size: 30,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    MainLabelText(
                      text: 'Settings',

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
              onTap: () {},
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/backup');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.backup,
                        size: 30,
                        color: color.disabledColor,

                        // color: color.hoverColor,
                      ),
                      SW.large(),
                      MainLabelText(
                        text: 'Backups',
                        isColor: true,
                        color: color.disabledColor,
                        // color: color.hoverColor,
                      ),
                    ],
                  ),
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
              onTap: () {},
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.disabledColor,
                    borderRadius: BorderRadius.circular(25)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/getpremium");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        size: 30,
                        color: color.disabledColor,

                        // color: color.hoverColor,
                      ),
                      SW.large(),
                      MainLabelText(
                        isColor: true,
                        color: color.disabledColor,
                        text: 'Get Premium',
                        // color: color.hoverColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {},
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
                      Icons.star,
                      size: 30,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    MainLabelText(
                      isColor: true,
                      color: color.disabledColor,
                      text: 'Rate this app',
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
              onTap: () {},
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
                      Icons.contact_page_rounded,
                      size: 30,
                      color: color.disabledColor,

                      // color: color.hoverColor,
                    ),
                    SW.large(),
                    MainLabelText(
                      isColor: true,
                      color: color.disabledColor,
                      text: 'Contact us',
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
