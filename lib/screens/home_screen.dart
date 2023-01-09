// ignore_for_file: unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/screens/notification/notifications.dart';
import 'package:habbit_app/utilities/notification_utilities.dart';
import 'package:habbit_app/widgets/date_widget.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import '../controllers/home_page_controller.dart';
import '../widgets/text_widget/main_label_text.dart';
import 'package:vibration/vibration.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
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
          onPressed: () async {
            NotificationWeekAndTime? pickerSchedule =
                await pickSchedule(context);

            if (pickerSchedule != null) {
              createReminderNotification(pickerSchedule);
            }
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
                    child: DateList()),
                SH.large(),
                const Divider(),
                taskController.tasks.isEmpty &&
                        recurringTaskController.tasks.isEmpty &&
                        habbitSelectController.tasks.isEmpty
                    ? Column(
                        children: [
                          SH.large(),
                          SH.large(),
                          SH.large(),
                          SH.large(),
                          const Center(
                              child: MainLabelText(text: 'No upcoming plans')),
                          SH.medium(),
                          const Center(
                              child: DescriptionText(
                                  text: 'Add your upcoming plans')),
                        ],
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(
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
                                      text: 'All tasks',
                                      isBold: true,
                                      isColor: true,
                                      color: color.primaryColor,
                                    ),
                              taskController.tasks.isEmpty
                                  ? Container()
                                  : SH.medium(),
                              taskController.tasks.isEmpty
                                  ? Container()
                                  : ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: taskController.tasks.length,
                                      separatorBuilder: (context, index) =>
                                          SH.medium(),
                                      itemBuilder: (context, index) {
                                        return HomeCard(
                                            icon: categoryController.icon[
                                                categoryController.categories
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        taskController
                                                            .tasks[index]
                                                            .categoryId)
                                                    .icon],
                                            cardColor: categoryController
                                                    .iconColor[
                                                categoryController.categories
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        taskController
                                                            .tasks[index]
                                                            .categoryId)
                                                    .color],
                                            name: taskController
                                                .tasks[index].taskName);
                                      },
                                    ),
                              habbitSelectController.tasks.isEmpty
                                  ? Container()
                                  : SH.large(),
                              habbitSelectController.tasks.isEmpty
                                  ? Container()
                                  : LabelText(
                                      text: 'All habits',
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
                                            cardColor: categoryController
                                                    .iconColor[
                                                categoryController.categories
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        habbitSelectController
                                                            .tasks[index]
                                                            .categoryId)
                                                    .color],
                                            name: habbitSelectController
                                                .tasks[index].habitName);
                                      },
                                    ),
                              recurringTaskController.tasks.isEmpty
                                  ? Container()
                                  : SH.large(),
                              recurringTaskController.tasks.isEmpty
                                  ? Container()
                                  : LabelText(
                                      text: 'All recurring tasks',
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
                                      itemCount:
                                          recurringTaskController.tasks.length,
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
                                            cardColor: categoryController
                                                    .iconColor[
                                                categoryController.categories
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        recurringTaskController
                                                            .tasks[index]
                                                            .categoryId)
                                                    .color],
                                            name: recurringTaskController
                                                .tasks[index].rTaskName);
                                      },
                                    ),
                            ],
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
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: cardColor),
                  child: Icon(
                    icon,
                    color: color.backgroundColor,
                    size: 23,
                  ),
                ),
                SW.large(),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [MainLabelText(text: name)],
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
