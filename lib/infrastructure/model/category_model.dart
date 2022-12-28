import 'package:drift/drift.dart';

class CategoryModel extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('category_name')();
  IntColumn get color => integer().named('category_color')();
  IntColumn get icon => integer().named('category_icon')();
}