import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/db/db_config.dart';
import 'package:habbit_app/infrastructure/model/category_model.dart';
import 'package:habbit_app/infrastructure/model/habbit_model.dart';
import 'package:habbit_app/infrastructure/model/recurring_checklist_model.dart';
import 'package:habbit_app/infrastructure/model/task_model.dart';
import 'package:habbit_app/infrastructure/model/task_reminder_model.dart';
import 'package:path_provider/path_provider.dart';

import '../model/checklist_model.dart';
import '../model/habbit_checklist_model.dart';
import '../model/recurring_task_model.dart';
import '../model/repetition_model.dart';

part 'app_service.g.dart';

@DriftDatabase(tables: [
  CategoryModel,
  TaskModel,
  ChecklistModel,
  TaskReminderModel,
  RecurringTaskModel,
  RecurringChecklistModel,
  RecurringRepetitionModel,
  HabbitModel,
  HabbitChecklistModel
])
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

  Future<void> exportInto(String file) async {
    Directory root =
        await getTemporaryDirectory(); // this is using path_provider
    String directoryPath = root.path + file;
    await Directory(directoryPath).parent.create(recursive: true);
    // Make sure the directory of the target file exists
    // await file.parent.create(recursive: true);

    // Override an existing backup, sqlite expects the target file to be empty
    if (Directory(directoryPath).existsSync()) {
      Directory(directoryPath).deleteSync();
    }

    await customStatement('VACUUM INTO ?', [Directory(directoryPath).path]);
   
 
      // 2
  

    log("sdfsdf sdfsdf${Directory(directoryPath).path}");
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

//category
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

//taskService

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

//recurringService

  Future<List<RecurringTaskModelData>> getRecurringTasks() async {
    return await select(recurringTaskModel).get();
  }

  Stream<List<RecurringTaskModelData>> streamRecurringTasks() {
    return select(recurringTaskModel).watch();
  }

  Future<RecurringTaskModelData> getRecurringTask(int id) async {
    return await (select(recurringTaskModel)
          ..where((tbl) => tbl.rTaskId.equals(id)))
        .getSingle();
  }

  Future<bool> updateRecurringTask(RecurringTaskModelCompanion entity) async {
    return await update(recurringTaskModel).replace(entity);
  }

  Future<int> insertRecurringTask(RecurringTaskModelCompanion entity) async {
    return await into(recurringTaskModel).insert(entity);
  }

  Future<int> deleteRecurringTask(int id) async {
    return await (delete(recurringTaskModel)
          ..where((tbl) => tbl.rTaskId.equals(id)))
        .go();
  }

//habbitService

  Future<List<HabbitModelData>> getHabbits() async {
    return await select(habbitModel).get();
  }

  Stream<List<HabbitModelData>> streamHabbits() {
    return select(habbitModel).watch();
  }

  Future<HabbitModelData> getHabbit(int id) async {
    return await (select(habbitModel)..where((tbl) => tbl.habbitId.equals(id)))
        .getSingle();
  }

  Future<bool> updateHabbit(HabbitModelCompanion entity) async {
    return await update(habbitModel).replace(entity);
  }

  Future<int> insertHabbit(HabbitModelCompanion entity) async {
    return await into(habbitModel).insert(entity);
  }

  Future<int> deleteHabbit(int id) async {
    return await (delete(habbitModel)..where((tbl) => tbl.habbitId.equals(id)))
        .go();
  }

//checklistsService

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
//recurringChecklistService

  Future<List<RecurringChecklistModelData>> getRecurringChecklists() async {
    return await select(recurringChecklistModel).get();
  }

  Stream<List<RecurringChecklistModelData>> streamRecurringChecklist() {
    return select(recurringChecklistModel).watch();
  }

  Future<List<RecurringChecklistModelData>> getRecurringChecklist(
      int id) async {
    return await (select(recurringChecklistModel)
          ..where((tbl) => tbl.rTaskId.equals(id)))
        .get();
  }

  Future<bool> updateRecurringChecklist(
      RecurringChecklistModelCompanion entity) async {
    return await update(recurringChecklistModel).replace(entity);
  }

  Future<int> insertRecurringChecklist(
      RecurringChecklistModelCompanion entity) async {
    return await into(recurringChecklistModel).insert(entity);
  }

  Future<int> deleteRecurringChecklist(int id) async {
    return await (delete(recurringChecklistModel)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

//habbitCheckListService

  Future<List<HabbitChecklistModelData>> getHabbitChecklists() async {
    return await select(habbitChecklistModel).get();
  }

  Stream<List<HabbitChecklistModelData>> streamHabbitChecklist() {
    return select(habbitChecklistModel).watch();
  }

  Future<List<HabbitChecklistModelData>> getHabbitChecklist(int id) async {
    return await (select(habbitChecklistModel)
          ..where((tbl) => tbl.habbitId.equals(id)))
        .get();
  }

  Future<bool> updateHabbitChecklist(
      HabbitChecklistModelCompanion entity) async {
    return await update(habbitChecklistModel).replace(entity);
  }

  Future<int> insertHabbitChecklist(
      HabbitChecklistModelCompanion entity) async {
    return await into(habbitChecklistModel).insert(entity);
  }

  Future<int> deleteHabbitChecklist(int id) async {
    return await (delete(habbitChecklistModel)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

//repetitionService

  Future<List<RecurringRepetitionModelData>> getRecurringRepetitions() async {
    return await select(recurringRepetitionModel).get();
  }

  Stream<List<RecurringRepetitionModelData>> streamRecurringRepetition() {
    return select(recurringRepetitionModel).watch();
  }

  Future<List<RecurringRepetitionModelData>> getRecurringRepetition(
      int id) async {
    return await (select(recurringRepetitionModel)
          ..where((tbl) => tbl.id.equals(id)))
        .get();
  }

  Future<bool> updateRecurringRepetition(
      RecurringRepetitionModelCompanion entity) async {
    return await update(recurringRepetitionModel).replace(entity);
  }

  Future<int> insertRecurringRepetition(
      RecurringRepetitionModelCompanion entity) async {
    return await into(recurringRepetitionModel).insert(entity);
  }

  Future<int> deleteRecurringRepetition(int id) async {
    return await (delete(recurringRepetitionModel)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

//reminderService

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
