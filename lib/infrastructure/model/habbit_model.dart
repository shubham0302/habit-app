import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/task_reminder_model.dart';

import 'category_model.dart';
import 'repetition_model.dart';

class HabbitModel extends Table {
  IntColumn get habbitId => integer().autoIncrement()();
  IntColumn get priority => integer().named('habbit_priority')();
  IntColumn get reminderId => integer()
      .named('habbit_reminder_id')
      .withDefault(const Constant(1))
      .references(TaskReminderModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  IntColumn get categoryId => integer()
      .named('habbit_category_id')
      .withDefault(const Constant(1))
      .references(CategoryModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  IntColumn get repetitonId => integer()
      .named('habbit_repetition_id')
      .withDefault(const Constant(1))
      .references(RecurringRepetitionModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();
  TextColumn get habitName => text().named('habbit_name')();
  TextColumn get evaluate => text().named('r_evaluate')();

  TextColumn get habbitDescription => text().named('habbit_description')();
  DateTimeColumn get startDate => dateTime().named('habbit_start_date')();
  DateTimeColumn get endDate => dateTime().named('habbit_end_date')();


}
