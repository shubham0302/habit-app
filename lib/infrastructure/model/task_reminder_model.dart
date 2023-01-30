import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/habbit_model.dart';

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

class HabitReminderModel extends Table {
  IntColumn get reminderId => integer().autoIncrement()();
  // TextColumn get reminderTime => text().named('reminder_name')();
  DateTimeColumn get reminderTime => dateTime().named('reminder_name')();
  IntColumn get habitId => integer()
      .named('habit_id')
      .withDefault(const Constant(1))
      .references(HabbitModel, #habbitId,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get type =>
      text().named('type').withDefault(const Constant('notification'))();
  BoolColumn get always =>
      boolean().named('always').withDefault(const Constant(true))();
  TextColumn get days => text().named('day')();

  // IntColumn get color => integer().named('category_color')();
  // IntColumn get icon => integer().named('category_icon')();
}
