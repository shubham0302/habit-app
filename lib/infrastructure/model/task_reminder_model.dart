import 'package:drift/drift.dart';

class TaskReminderModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TextColumn get reminderTime => text().named('reminder_name')();
  DateTimeColumn get reminderTime => dateTime().named('reminder_name')();

  BoolColumn get isSound =>
      boolean().named('soung').withDefault(const Constant(false))();
  BoolColumn get isVibration =>
      boolean().named('vibration').withDefault(const Constant(false))();
  BoolColumn get isCompletedAc =>
      boolean().named('completed').withDefault(const Constant(false))();
  BoolColumn get isAlways =>
      boolean().named('always').withDefault(const Constant(false))();
  TextColumn get days => text().named('day')();
  // IntColumn get color => integer().named('category_color')();
  // IntColumn get icon => integer().named('category_icon')();
}
