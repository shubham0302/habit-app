import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/habbit_model.dart';
import 'package:habbit_app/infrastructure/model/recurring_task_model.dart';

class HabbitChecklistModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get rChecklistName => text().named('habbit_checklist_name')();
  IntColumn get habbitId => integer()
      .named('habbit_checklist_task_id')
      .withDefault(const Constant(1))
      .references(HabbitModel, #habbitId,
          onDelete: KeyAction.setDefault, onUpdate: KeyAction.cascade)();

  BoolColumn get isDone =>
      boolean().named('status').withDefault(const Constant(false))();
  // IntColumn get color => integer().named('category_color')();
  // IntColumn get icon => integer().named('category_icon')();
}
