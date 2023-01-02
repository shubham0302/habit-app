import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/db/db_config.dart';
import 'package:habbit_app/infrastructure/model/category_model.dart';
import 'package:habbit_app/infrastructure/model/recurring_checklist_model.dart';
import 'package:habbit_app/infrastructure/model/task_model.dart';
import 'package:habbit_app/infrastructure/model/task_reminder_model.dart';

import '../model/checklist_model.dart';
import '../model/recurring_task_model.dart';

part 'app_service.g.dart';

@DriftDatabase(
    tables: [CategoryModel, TaskModel, ChecklistModel, TaskReminderModel,RecurringTaskModel,RecurringChecklistModel])
class AppDB extends _$AppDB {
  AppDB() : super(openConnection());

  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }

  Future<List<CategoryModelData>> getCategories() async {
    return await select(categoryModel).get();
  }

  Stream<List<CategoryModelData>> streamCategories() {
    return (select(categoryModel)
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]))
        .watch();
  }
  // Stream<List<CategoryModelData>> streamCategoriesDefault() {
  //   return select(categoryModel).watch();
  // }
  // Stream<List<CategoryModelData>> streamCategories() {
  //   return select(categoryModel).watch();
  // }

  Future<CategoryModelData> getCategory(int id) async {
    return await (select(categoryModel)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateCategory(CategoryModelCompanion entity) async {
    return await update(categoryModel).replace(entity);
  }

  Future<int> insertCategory(CategoryModelCompanion entity) async {
    return await into(categoryModel).insert(entity);
  }

  Future<int> deleteCategory(int id) async {
    return await (delete(categoryModel)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<TaskModelData>> getTasks() async {
    return await select(taskModel).get();
  }

  Stream<List<TaskModelData>> streamTasks() {
    return select(taskModel).watch();
  }

  Future<TaskModelData> getTask(int id) async {
    return await (select(taskModel)..where((tbl) => tbl.taskId.equals(id)))
        .getSingle();
  }

  Future<bool> updateTask(TaskModelCompanion entity) async {
    return await update(taskModel).replace(entity);
  }

  Future<int> insertTask(TaskModelCompanion entity) async {
    return await into(taskModel).insert(entity);
  }

  Future<int> deleteTask(int id) async {
    return await (delete(taskModel)..where((tbl) => tbl.taskId.equals(id)))
        .go();
  }

  Future<List<RecurringTaskModelData>> getRecurringTasks() async {
    return await select(recurringTaskModel).get();
  }

  Stream<List<RecurringTaskModelData>> streamRecurringTasks() {
    return select(recurringTaskModel).watch();
  }

  Future<RecurringTaskModelData> getRecurringTask(int id) async {
    return await (select(recurringTaskModel)..where((tbl) => tbl.rTaskId.equals(id)))
        .getSingle();
  }

  Future<bool> updateRecurringTask(RecurringTaskModelCompanion entity) async {
    return await update(recurringTaskModel).replace(entity);
  }

  Future<int> insertRecurringTask(RecurringTaskModelCompanion entity) async {
    return await into(recurringTaskModel).insert(entity);
  }

  Future<int> deleteRecurringTask(int id) async {
    return await (delete(recurringTaskModel)..where((tbl) => tbl.rTaskId.equals(id)))
        .go();
  }

  Future<List<ChecklistModelData>> getChecklists() async {
    return await select(checklistModel).get();
  }

  Stream<List<ChecklistModelData>> streamChecklist() {
    return select(checklistModel).watch();
  }

  Future<List<ChecklistModelData>> getChecklist(int id) async {
    return await (select(checklistModel)..where((tbl) => tbl.taslId.equals(id)))
        .get();
  }

  Future<bool> updateChecklist(ChecklistModelCompanion entity) async {
    return await update(checklistModel).replace(entity);
  }

  Future<int> insertChecklist(ChecklistModelCompanion entity) async {
    return await into(checklistModel).insert(entity);
  }

  Future<int> deleteChecklist(int id) async {
    return await (delete(checklistModel)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<RecurringChecklistModelData>> getRecurringChecklists() async {
    return await select(recurringChecklistModel).get();
  }

  Stream<List<RecurringChecklistModelData>> streamRecurringChecklist() {
    return select(recurringChecklistModel).watch();
  }

  Future<List<RecurringChecklistModelData>> getRecurringChecklist(int id) async {
    return await (select(recurringChecklistModel)..where((tbl) => tbl.rTaskId.equals(id)))
        .get();
  }

  Future<bool> updateRecurringChecklist(RecurringChecklistModelCompanion entity) async {
    return await update(recurringChecklistModel).replace(entity);
  }

  Future<int> insertRecurringChecklist(RecurringChecklistModelCompanion entity) async {
    return await into(recurringChecklistModel).insert(entity);
  }

  Future<int> deleteRecurringChecklist(int id) async {
    return await (delete(recurringChecklistModel)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<TaskReminderModelData>> getReminders() async {
    return await select(taskReminderModel).get();
  }

  Stream<List<TaskReminderModelData>> streamReminders() {
    return select(taskReminderModel).watch();
  }

  Future<TaskReminderModelData> getReminder(int id) async {
    return await (select(taskReminderModel)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateReminder(TaskReminderModelCompanion entity) async {
    return await update(taskReminderModel).replace(entity);
  }

  Future<int> insertReminder(TaskReminderModelCompanion entity) async {
    return await into(taskReminderModel).insert(entity);
  }

  Future<int> deleteReminder(int id) async {
    return await (delete(taskReminderModel)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
