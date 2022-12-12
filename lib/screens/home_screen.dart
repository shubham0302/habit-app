import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    ThemeData color = Theme.of(context);
    return Obx(
      () => Scaffold(
          backgroundColor: color.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(children: [
                SH.large(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            // print('asd');

                            child: const Icon(
                              Icons.format_list_bulleted_outlined,
                              color: Colors.black,
                            ),
                          ),
                          SW.small(),
                          const TitleText(text: "Today")
                        ],
                      ),
                      GestureDetector(
                        onTap: (() => Scaffold.of(context).openDrawer()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.search),
                            SW.small(),
                            const Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SH.medium(),
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
                const HeadingText(text: "abcd")
                // Container(
                //   color: Color.fromARGB(255, 146, 212, 243),
                //   child: DatePicker(
                //     DateTime.now(),
                //     height: 80,
                //     width: 60,
                //     initialSelectedDate: DateTime.now(),
                //     selectionColor: Colors.blue,
                //     selectedTextColor: Colors.white,
                //     dateTextStyle: GoogleFonts.lato(
                //         textStyle: TextStyle(
                //             fontSize: 30,
                //             fontWeight: FontWeight.w600,
                //             color: Colors.black)),
                //     monthTextStyle: GoogleFonts.lato(
                //         textStyle: TextStyle(
                //             fontSize: 10,
                //             fontWeight: FontWeight.w600,
                //             color: Colors.black)),
                //   ),
                // )
              ]),
            ),
          )),
    );
  }
}
