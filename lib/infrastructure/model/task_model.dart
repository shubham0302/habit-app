import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/task_reminder_model.dart';

import 'category_model.dart';


class TaskModel extends Table {
  IntColumn get taskId => integer().autoIncrement()();
  IntColumn get priority => integer().named('task_priority')();
  IntColumn get reminderId => integer()
      .named('task_reminder_id')
      .withDefault(const Constant(1))
      .references(TaskReminderModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  IntColumn get categoryId =>
      integer().named('task_category_id').withDefault(const Constant(1)).references(CategoryModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get taskName => text().named('task_name')();
  DateTimeColumn get taskDate => dateTime().named('task_date')();
  BoolColumn get pendingTask => boolean().named('task_pending').withDefault(const Constant(false))();
  // IntColumn get color => integer().named('category_color')();
  // IntColumn get icon => integer().named('category_icon')();
}
