import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/db/db_config.dart';
import 'package:habbit_app/infrastructure/model/category_model.dart';

part 'category_services.g.dart';



@DriftDatabase(tables: [CategoryModel])
class CategoryClass extends _$CategoryClass{

  CategoryClass() : super(openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CategoryModelData>> getCategories() async{
    return await select(categoryModel).get();
  }
  Future<CategoryModelData> getCategory(int id) async{
    return await (select(categoryModel)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
  Future<bool> updateCategory(CategoryModelCompanion entity) async{
    return await update(categoryModel).replace(entity);
  }
  Future<int> insertCategory(CategoryModelCompanion entity) async{
    return await into(categoryModel).insert(entity);
  }
  Future<int> deleteCategory(int id) async{
    return await (delete(categoryModel)..where((tbl) => tbl.id.equals(id))).go();
  }

}