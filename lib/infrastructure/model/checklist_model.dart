import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/task_model.dart';

import 'category_model.dart';

class ChecklistModel extends Table {
  IntColumn get Id => integer().autoIncrement()();
  TextColumn get checklistName => text().named('checklist_name')();
  IntColumn get taslId => integer()
      .named('checklist_task_id')
      .withDefault(const Constant(1))
      .references(TaskModel, #id,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();

  BoolColumn get isDone =>
      boolean().named('status').withDefault(const Constant(false))();
  // IntColumn get color => integer().named('category_color')();
  // IntColumn get icon => integer().named('category_icon')();
}
