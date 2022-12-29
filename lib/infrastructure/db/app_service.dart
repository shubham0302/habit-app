import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/db/db_config.dart';
import 'package:habbit_app/infrastructure/model/category_model.dart';
import 'package:habbit_app/infrastructure/model/task_model.dart';

import '../model/checklist_model.dart';

part 'app_service.g.dart';

@DriftDatabase(tables: [CategoryModel, TaskModel, ChecklistModel])
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
    return select(categoryModel).watch();
  }

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

  Future<List<ChecklistModelData>> getChecklists() async {
    return await select(checklistModel).get();
  }

  Stream<List<ChecklistModelData>> streamChecklist() {
    return select(checklistModel).watch();
  }

  Future<ChecklistModelData> getChecklist(int id) async {
    return await (select(checklistModel)..where((tbl) => tbl.Id.equals(id)))
        .getSingle();
  }

  Future<bool> updateChecklist(ChecklistModelCompanion entity) async {
    return await update(checklistModel).replace(entity);
  }

  Future<int> insertChecklist(ChecklistModelCompanion entity) async {
    return await into(checklistModel).insert(entity);
  }

  Future<int> deleteChecklist(int id) async {
    return await (delete(checklistModel)..where((tbl) => tbl.Id.equals(id)))
        .go();
  }
}
