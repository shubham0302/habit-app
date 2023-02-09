import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/utilities/notification_utilities.dart';

Future<void> createFirstNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'yo yo',
        body: 'Its working good',
        // bigPicture: 'assets://assets/images/middle.jpeg',
        notificationLayout: NotificationLayout.BigPicture),
  );
}

Future<void> createReminderNotification(
    NotificationRemindPrograme notificationScheduled) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduledRemind_channel',
          title: 'yo yo',
          body: 'Lodu ',
          // bigPicture: 'assets://assets/images/middle.jpeg',
          notificationLayout: NotificationLayout.Default),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
          // weekday: notificationSchedule.dayOfTheWeek,
          hour: notificationScheduled.timeOfDay.hour,
          minute: notificationScheduled.timeOfDay.minute,
          second: 0,
          millisecond: 0,
          repeats: true));
}

Future<void> createDailyNotification(
    NotificationDailyPrograme notificationSchedule) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: 'yo yo',
          body: 'Lodu Lalit',
          bigPicture: 'assets://assets/images/middle.jpeg',
          notificationLayout: NotificationLayout.Default),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
          // weekday: notificationSchedule.dayOfTheWeek,
          hour: notificationSchedule.timeOfDay.hour,
          minute: notificationSchedule.timeOfDay.minute,
          second: 0,
          millisecond: 0,
          repeats: true));
}

Future<void> habitReminderNotification(
    NotificationHabitReminder notificationScheduled, name) async {
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduledHabit_channel',
          title: "${name}",
          body: 'Lodunvfkj ',
          // bigPicture: 'assets://assets/images/middle.jpeg',
          notificationLayout: NotificationLayout.Default),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
          // weekday: notificationSchedule.dayOfTheWeek,
          hour: notificationScheduled.timeOfDay.hour,
          minute: notificationScheduled.timeOfDay.minute,
          second: 0,
          millisecond: 0,
          repeats: true));
}

Future<void> createHabitAlarmNotification(
    NotificationHabitAlarm notificationScheduled, index) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduledHabitAlarm_channel',
          title: 'Alarm',
          body: 'fuck you',
          // customSound: 'resource://raw/still_dre',
          displayOnBackground: true,
          displayOnForeground: true,
          // bigPicture: 'assets://assets/images/middle.jpeg',
          notificationLayout: NotificationLayout.Default),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
        NotificationActionButton(
          key: 'MARK_SNOOZE',
          label: 'Mark Snooze',
        ),
      ],
      schedule: NotificationCalendar(
          // weekday: notificationSchedule.dayOfTheWeek,
          hour: notificationScheduled.timeOfDay.hour,
          minute: notificationScheduled.timeOfDay.minute,
          second: 0,
          millisecond: 0,
          repeats: true));
}

Future<void> cancelReminderNotification() async {
  await AwesomeNotifications().cancelAllSchedules();
}
