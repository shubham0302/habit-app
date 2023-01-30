import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/task_reminder_model.dart';

import 'category_model.dart';
import 'repetition_model.dart';

class RecurringTaskModel extends Table {
  IntColumn get rTaskId => integer().autoIncrement()();
  IntColumn get priority => integer().named('r_priority')();
  IntColumn get reminderId => integer()
      .named('r_reminder_id')
      .withDefault(const Constant(1))
      .references(TaskReminderModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  IntColumn get categoryId => integer()
      .named('r_category_id')
      .withDefault(const Constant(1))
      .references(CategoryModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  IntColumn get repetitonId => integer()
      .named('r_repetition_id')
      .withDefault(const Constant(1))
      .references(RecurringRepetitionModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get rTaskName => text().named('r_name')();
  TextColumn get evaluate => text().named('r_evaluate')();

  TextColumn get rDescription => text().named('r_description')();
  DateTimeColumn get startDate => dateTime().named('r_start_date')();
  DateTimeColumn get endDate => dateTime().named('r_end_date')();
  BoolColumn get archive =>
      boolean().named('recurring_archive').withDefault(const Constant(false))();

  BoolColumn get archived =>
      boolean().named('reurring_archived').withDefault(const Constant(false))();

  // IntColumn get color => integer().named('category_color')();
  // IntColumn get icon => integer().named('category_icon')();
}
