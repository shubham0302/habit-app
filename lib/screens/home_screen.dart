// ignore_for_file: unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/db_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/date_widget.dart';
import 'package:habbit_app/widgets/icon_widget.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_text_large.dart';
import '../controllers/home_page_controller.dart';
import '../widgets/text_widget/main_label_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //             title: Text('Allow Notifications'),
    //             content: Text('Habbit app like to send you notifications'),
    //             actions: [
    //               TextButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   child: Text(
    //                     'Don\'t allow',
    //                     style: TextStyle(
    //                       color: Colors.grey,
    //                       fontSize: 18,
    //                     ),
    //                   )),
    //               TextButton(
    //                   onPressed: () => AwesomeNotifications()
    //                       .requestPermissionToSendNotifications()
    //                       .then((_) => Navigator.pop(context)),
    //                   child: Text(
    //                     'Allow',
    //                     style: TextStyle(
    //                         color: Colors.teal,
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold),
    //                   )),
    //             ],
    //           ));
    // },
    // );
  }

  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    DBController dbController = Get.put(DBController(), permanent: false);
    AddTaskController taskController =
        Get.put(AddTaskController(), permanent: false);
    AddRecurringTaskController recurringTaskController =
        Get.put(AddRecurringTaskController(), permanent: false);
    AddHabbitSelectController habbitSelectController =
        Get.put(AddHabbitSelectController(), permanent: false);
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);

    ThemeController themeController = Get.find<ThemeController>();

    ThemeData color = Theme.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //
            // taskController.getDownloadPath();
          },
          backgroundColor: color.primaryColor,
          child: const Icon(Icons.add),
        ),
        backgroundColor: color.backgroundColor,
        body: GlobalPadding(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    child: const DateList()),
                SH.large(),
                const Divider(),
                Obx(
                  () => taskController.tasks.isEmpty &&
                          recurringTaskController.tasks.isEmpty &&
                          habbitSelectController.tasks.isEmpty
                      ? Column(
                          children: [
                            SH.large(),
                            SH.large(),
                            SH.large(),
                            SH.large(),
                            Center(
                                child: MainLabelText(
                                    text: 'No upcoming plans'.tr)),
                            SH.medium(),
                            Center(
                                child: DescriptionText(
                                    text: 'Add your upcoming plans'.tr)),
                          ],
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                taskController.tasks.isEmpty
                                    ? Container()
                                    : SH.large(),
                                taskController.tasks.isEmpty
                                    ? Container()
                                    : LabelText(
                                        text: 'All tasks'.tr,
                                        isBold: true,
                                        isColor: true,
                                        color: color.primaryColor,
                                      ),
                                taskController.tasks.isEmpty
                                    ? Container()
                                    : SH.medium(),
                                taskController.tasks.isEmpty
                                    ? Container()
                                    : AnimationLimiter(
                                        child: ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              taskController.tasks.length,
                                          separatorBuilder: (context, index) =>
                                              SH.medium(),
                                          itemBuilder: (context, index) {
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 375),
                                              child: SlideAnimation(
                                                verticalOffset: 50.0,
                                                child: FadeInAnimation(
                                                  child: HomeCard(
                                                      icon: categoryController.icon[categoryController
                                                          .categories
                                                          .firstWhere((element) =>
                                                              element.id ==
                                                              taskController
                                                                  .tasks[index]
                                                                  .categoryId)
                                                          .icon],
                                                      cardColor: color.brightness ==
                                                              Brightness.dark
                                                          ? categoryController.iconColor[categoryController
                                                              .categories
                                                              .firstWhere((element) =>
                                                                  element.id ==
                                                                  taskController
                                                                      .tasks[index]
                                                                      .categoryId)
                                                              .color]
                                                          : categoryController.iconLightColor[categoryController.categories.firstWhere((element) => element.id == taskController.tasks[index].categoryId).color],
                                                      name: taskController.tasks[index].taskName),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                habbitSelectController.tasks.isEmpty
                                    ? Container()
                                    : SH.large(),
                                habbitSelectController.tasks.isEmpty
                                    ? Container()
                                    : LabelText(
                                        text: 'All habits'.tr,
                                        isBold: true,
                                        isColor: true,
                                        color: color.primaryColor,
                                      ),
                                habbitSelectController.tasks.isEmpty
                                    ? Container()
                                    : SH.medium(),
                                habbitSelectController.tasks.isEmpty
                                    ? Container()
                                    : ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            habbitSelectController.tasks.length,
                                        separatorBuilder: (context, index) =>
                                            SH.medium(),
                                        itemBuilder: (context, index) {
                                          return HomeCard(
                                              icon: categoryController.icon[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          habbitSelectController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .icon],
                                              cardColor: color.brightness == Brightness.dark
                                                  ? categoryController.iconColor[
                                                      categoryController
                                                          .categories
                                                          .firstWhere((element) =>
                                                              element.id ==
                                                              habbitSelectController
                                                                  .tasks[index]
                                                                  .categoryId)
                                                          .color]
                                                  : categoryController
                                                      .iconLightColor[categoryController.categories.firstWhere((element) => element.id == habbitSelectController.tasks[index].categoryId).color],
                                              name: habbitSelectController.tasks[index].habitName);
                                        },
                                      ),
                                recurringTaskController.tasks.isEmpty
                                    ? Container()
                                    : SH.large(),
                                recurringTaskController.tasks.isEmpty
                                    ? Container()
                                    : LabelText(
                                        text: 'All recurring tasks'.tr,
                                        isBold: true,
                                        isColor: true,
                                        color: color.primaryColor,
                                      ),
                                recurringTaskController.tasks.isEmpty
                                    ? Container()
                                    : SH.medium(),
                                recurringTaskController.tasks.isEmpty
                                    ? Container()
                                    : ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: recurringTaskController
                                            .tasks.length,
                                        separatorBuilder: (context, index) =>
                                            SH.medium(),
                                        itemBuilder: (context, index) {
                                          return HomeCard(
                                              icon: categoryController.icon[
                                                  categoryController.categories
                                                      .firstWhere((element) =>
                                                          element.id ==
                                                          recurringTaskController
                                                              .tasks[index]
                                                              .categoryId)
                                                      .icon],
                                              cardColor: color.brightness ==
                                                      Brightness.dark
                                                  ? categoryController.iconColor[
                                                      categoryController.categories
                                                          .firstWhere((element) =>
                                                              element.id ==
                                                              recurringTaskController
                                                                  .tasks[index]
                                                                  .categoryId)
                                                          .color]
                                                  : categoryController
                                                      .iconLightColor[categoryController.categories.firstWhere((element) => element.id == recurringTaskController.tasks[index].categoryId).color],
                                              name: recurringTaskController.tasks[index].rTaskName);
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ),
                ),
              ]),
        ));
  }
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final Color cardColor;
  final String name;
  const HomeCard(
      {Key? key,
      required this.icon,
      required this.cardColor,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    var color = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.disabledColor.withOpacity(.1)),
      child: GlobalPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Container(
                //   height: 30,
                //   width: 30,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8), color: cardColor),
                //   child: Icon(
                //     icon,
                //     color: color.backgroundColor,
                //     size: 23,
                //   ),
                // ),
                // Obx(()=>
                IconWidgetClassic(
                  contanerSize: true,
                  contanerHight: 30,
                  contanerWidth: 30,
                  icon: icon,
                  contanerColor: cardColor,
                ),
                // ),
                SW.large(),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => switchController.textSizing.value == 'Default'
                          ? MainLabelText(text: name)
                          : MainLabelTextLarge(text: name),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color.backgroundColor),
            )
          ],
        ),
      ),
    );
  }
}
