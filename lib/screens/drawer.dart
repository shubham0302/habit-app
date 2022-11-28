import 'package:flutter/material.dart';
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
            const HeadingText(text: 'HabitNow'),
            SH.small(),
            const LabelText(text: 'Monday'),
            SH.small(),
            const LabelText(
              text: 'November 28,2022',
              isNormal: true,
            ),
            SH.large(),
            const Divider(),
            SH.large(),
            InkWell(
              onTap: () {},
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Home',
                      color: color.hoverColor,
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
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Timer',
                      // color: color.hoverColor,
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
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.category,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Categories',
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            // SH.large(),
            const Divider(),
            // SH.large(),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              splashColor: color.hoverColor,
              onTap: () {},
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard_customize,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Customize',
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
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Settings',
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
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.backup,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Backups',
                      // color: color.hoverColor,
                    ),
                  ],
                ),
              ),
            ),
            // SH.large(),
            const Divider(),
            // SH.large(),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {},
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
                      text: 'Get Premium',
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
              splashColor: color.hoverColor,
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
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
              splashColor: color.hoverColor,
              onTap: () {},
              child: Container(
                height: 45,
                padding: const EdgeInsets.only(left: 21),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: color.indicatorColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Icon(
                      Icons.contact_page_rounded,
                      // color: color.hoverColor,
                    ),
                    SW.medium(),
                    MainLabelText(
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
