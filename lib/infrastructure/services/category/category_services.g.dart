// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_services.dart';

// ignore_for_file: type=lint
class CategoryModelData extends DataClass
    implements Insertable<CategoryModelData> {
  final int id;
  final String name;
  final int color;
  final int icon;
  const CategoryModelData(
      {required this.id,
      required this.name,
      required this.color,
      required this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_name'] = Variable<String>(name);
    map['category_color'] = Variable<int>(color);
    map['category_icon'] = Variable<int>(icon);
    return map;
  }

  CategoryModelCompanion toCompanion(bool nullToAbsent) {
    return CategoryModelCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      icon: Value(icon),
    );
  }

  factory CategoryModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
      icon: serializer.fromJson<int>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
      'icon': serializer.toJson<int>(icon),
    };
  }

  CategoryModelData copyWith({int? id, String? name, int? color, int? icon}) =>
      CategoryModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        icon: icon ?? this.icon,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.icon == this.icon);
}

class CategoryModelCompanion extends UpdateCompanion<CategoryModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  final Value<int> icon;
  const CategoryModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CategoryModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int color,
    required int icon,
  })  : name = Value(name),
        color = Value(color),
        icon = Value(icon);
  static Insertable<CategoryModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? color,
    Expression<int>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'category_name': name,
      if (color != null) 'category_color': color,
      if (icon != null) 'category_icon': icon,
    });
  }

  CategoryModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? color,
      Value<int>? icon}) {
    return CategoryModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['category_name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['category_color'] = Variable<int>(color.value);
    }
    if (icon.present) {
      map['category_icon'] = Variable<int>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $CategoryModelTable extends CategoryModel
    with TableInfo<$CategoryModelTable, CategoryModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'category_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'category_color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
      'category_icon', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color, icon];
  @override
  String get aliasedName => _alias ?? 'category_model';
  @override
  String get actualTableName => 'category_model';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['category_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_color')) {
      context.handle(_colorMeta,
          color.isAcceptableOrUnknown(data['category_color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('category_icon')) {
      context.handle(_iconMeta,
          icon.isAcceptableOrUnknown(data['category_icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_color'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_icon'])!,
    );
  }

  @override
  $CategoryModelTable createAlias(String alias) {
    return $CategoryModelTable(attachedDatabase, alias);
  }
}

abstract class _$CategoryClass extends GeneratedDatabase {
  _$CategoryClass(QueryExecutor e) : super(e);
  late final $CategoryModelTable categoryModel = $CategoryModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categoryModel];
}
