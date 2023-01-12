import 'package:flutter/material.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationDailyPrograme {
  // final int dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationDailyPrograme({
    // required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

class NotificationRemindPrograme {
  // final int dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationRemindPrograme({
    // required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

Future<NotificationRemindPrograme?> pickScheduled(
  BuildContext context,
) async {
  // List<String> weekdays = [
  //   'Mon',
  //   'Tue',
  //   'Wed',
  //   'Thu',
  //   'Fri',
  //   'Sat',
  //   'Sun',
  // ];
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();

  // await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'I want to be reminded every:',
  //           textAlign: TextAlign.center,
  //         ),
  //         content: Wrap(
  //           alignment: WrapAlignment.center,
  //           spacing: 3,
  //           children: [
  //             for (int index = 0; index < weekdays.length; index++)
  //               ElevatedButton(
  //                 onPressed: () {
  //                   selectedDay = index + 1;
  //                   Navigator.pop(context);
  //                 },
  //                 style: ButtonStyle(
  //                   backgroundColor: MaterialStateProperty.all(
  //                     Colors.teal,
  //                   ),
  //                 ),
  //                 child: Text(weekdays[index]),
  //               ),
  //           ],
  //         ),
  //       );
  //     });

  // if () {
  timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        now.add(
          const Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.teal,
            ),
          ),
          child: child!,
        );
      });

  if (timeOfDay != null) {
    return NotificationRemindPrograme(
        // dayOfTheWeek: selectedDay!,
        timeOfDay: timeOfDay);
  }
  return null;
}
// return null;
// }

Future<NotificationDailyPrograme?> pickSchedule(
  BuildContext context,
) async {
  // List<String> weekdays = [
  //   'Mon',
  //   'Tue',
  //   'Wed',
  //   'Thu',
  //   'Fri',
  //   'Sat',
  //   'Sun',
  // ];
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();

  // await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'I want to be reminded every:',
  //           textAlign: TextAlign.center,
  //         ),
  //         content: Wrap(
  //           alignment: WrapAlignment.center,
  //           spacing: 3,
  //           children: [
  //             for (int index = 0; index < weekdays.length; index++)
  //               ElevatedButton(
  //                 onPressed: () {
  //                   selectedDay = index + 1;
  //                   Navigator.pop(context);
  //                 },
  //                 style: ButtonStyle(
  //                   backgroundColor: MaterialStateProperty.all(
  //                     Colors.teal,
  //                   ),
  //                 ),
  //                 child: Text(weekdays[index]),
  //               ),
  //           ],
  //         ),
  //       );
  //     });

  // if () {
  timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        now.add(
          const Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.teal,
            ),
          ),
          child: child!,
        );
      });

  if (timeOfDay != null) {
    return NotificationDailyPrograme(
        // dayOfTheWeek: selectedDay!,
        timeOfDay: timeOfDay);
  }
  return null;
}
// return null;
// }


