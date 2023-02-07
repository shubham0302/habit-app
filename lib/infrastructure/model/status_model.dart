import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/habbit_model.dart';
import 'package:habbit_app/infrastructure/model/recurring_task_model.dart';
import 'package:habbit_app/infrastructure/model/task_model.dart';

// habit status model

class HabitStatusModel extends Table {
  IntColumn get statusId => integer().autoIncrement()();
  IntColumn get habitId => integer()
      .named('habit_id')
      .withDefault(const Constant(1))
      .references(HabbitModel, #habbitId,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get status => text().named('habit_status')();
  TextColumn get value => text().named('habit_value')();
  TextColumn get type => text().named('habit_evaluate_type')();
  DateTimeColumn get date => dateTime().named('status_date')();
}

// task status model

class TaskStatusModel extends Table {
  IntColumn get statusId => integer().autoIncrement()();
  IntColumn get habitId => integer()
      .named('task_id')
      .withDefault(const Constant(1))
      .references(TaskModel, #taskId,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get status => text().named('task_status')();
  DateTimeColumn get date => dateTime().named('status_date')();
}

// recurring task status model

class RecurringStatusModel extends Table {
  IntColumn get statusId => integer().autoIncrement()();
  IntColumn get habitId => integer()
      .named('recurring_id')
      .withDefault(const Constant(1))
      .references(RecurringTaskModel, #rTaskId,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get status => text().named('task_status')();
  DateTimeColumn get date => dateTime().named('status_date')();
}
