import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:habbit_app/utilities/notification_utilities.dart';

Future<void> createFirstNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'yo yo',
        body: 'Its working good',
        bigPicture: 'assets://assets/images/middle.jpeg',
        notificationLayout: NotificationLayout.BigPicture),
  );
}

Future<void> createReminderNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: 'yo yo',
          body: 'Lodu Lalit',
          // bigPicture: 'assets://assets/images/middle.jpeg',
          notificationLayout: NotificationLayout.Default),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
          weekday: notificationSchedule.dayOfTheWeek,
          hour: notificationSchedule.timeOfDay.hour,
          minute: notificationSchedule.timeOfDay.minute,
          second: 0,
          millisecond: 0,
          repeats: true));
}

Future<void> cancelReminderNotification() async {
  await AwesomeNotifications().cancelAllSchedules();
}
