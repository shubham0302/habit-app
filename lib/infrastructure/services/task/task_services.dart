// import 'package:drift/drift.dart';
// import 'package:habbit_app/infrastructure/db/db_config.dart';
// import 'package:habbit_app/infrastructure/model/category_model.dart';

// import 'package:habbit_app/infrastructure/model/task_model.dart';

// part 'task_services.g.dart';

// @DriftDatabase(tables: [TaskModel])
// class TaskClass extends _$TaskClass {
//   TaskClass() : super(openConnection());

//   @override
//   int get schemaVersion => 1;

//   Future<List<TaskModelData>> getTasks() async {
//     return await select(taskModel).get();
//   }

//   Stream<List<TaskModelData>> streamTasks() {
//     return select(taskModel).watch();
//   }

//   Future<TaskModelData> getTask(int id) async {
//     return await (select(taskModel)..where((tbl) => tbl.taskId.equals(id)))
//         .getSingle();
//   }

//   Future<bool> updateTask(TaskModelCompanion entity) async {
//     return await update(taskModel).replace(entity);
//   }

//   Future<int> insertTask(TaskModelCompanion entity) async {
//     return await into(taskModel).insert(entity);
//   }

//   Future<int> deleteTask(int id) async {
//     return await (delete(taskModel)..where((tbl) => tbl.taskId.equals(id)))
//         .go();
//   }
// }
