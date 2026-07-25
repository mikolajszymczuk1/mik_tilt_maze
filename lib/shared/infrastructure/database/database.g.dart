// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LevelProgressTableTable extends LevelProgressTable
    with TableInfo<$LevelProgressTableTable, level_progress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumn<int> stars = GeneratedColumn<int>(
    'stars',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, stars];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'level_progress_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<level_progress> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('stars')) {
      context.handle(
        _starsMeta,
        stars.isAcceptableOrUnknown(data['stars']!, _starsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  level_progress map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return level_progress(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      stars: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars'],
      )!,
    );
  }

  @override
  $LevelProgressTableTable createAlias(String alias) {
    return $LevelProgressTableTable(attachedDatabase, alias);
  }
}

class level_progress extends DataClass implements Insertable<level_progress> {
  final String id;
  final int stars;
  const level_progress({required this.id, required this.stars});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['stars'] = Variable<int>(stars);
    return map;
  }

  LevelProgressTableCompanion toCompanion(bool nullToAbsent) {
    return LevelProgressTableCompanion(id: Value(id), stars: Value(stars));
  }

  factory level_progress.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return level_progress(
      id: serializer.fromJson<String>(json['id']),
      stars: serializer.fromJson<int>(json['stars']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'stars': serializer.toJson<int>(stars),
    };
  }

  level_progress copyWith({String? id, int? stars}) =>
      level_progress(id: id ?? this.id, stars: stars ?? this.stars);
  level_progress copyWithCompanion(LevelProgressTableCompanion data) {
    return level_progress(
      id: data.id.present ? data.id.value : this.id,
      stars: data.stars.present ? data.stars.value : this.stars,
    );
  }

  @override
  String toString() {
    return (StringBuffer('level_progress(')
          ..write('id: $id, ')
          ..write('stars: $stars')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stars);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is level_progress &&
          other.id == this.id &&
          other.stars == this.stars);
}

class LevelProgressTableCompanion extends UpdateCompanion<level_progress> {
  final Value<String> id;
  final Value<int> stars;
  final Value<int> rowid;
  const LevelProgressTableCompanion({
    this.id = const Value.absent(),
    this.stars = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LevelProgressTableCompanion.insert({
    required String id,
    this.stars = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<level_progress> custom({
    Expression<String>? id,
    Expression<int>? stars,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stars != null) 'stars': stars,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LevelProgressTableCompanion copyWith({
    Value<String>? id,
    Value<int>? stars,
    Value<int>? rowid,
  }) {
    return LevelProgressTableCompanion(
      id: id ?? this.id,
      stars: stars ?? this.stars,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (stars.present) {
      map['stars'] = Variable<int>(stars.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelProgressTableCompanion(')
          ..write('id: $id, ')
          ..write('stars: $stars, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LevelProgressTableTable levelProgressTable =
      $LevelProgressTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [levelProgressTable];
}

typedef $$LevelProgressTableTableCreateCompanionBuilder =
    LevelProgressTableCompanion Function({
      required String id,
      Value<int> stars,
      Value<int> rowid,
    });
typedef $$LevelProgressTableTableUpdateCompanionBuilder =
    LevelProgressTableCompanion Function({
      Value<String> id,
      Value<int> stars,
      Value<int> rowid,
    });

class $$LevelProgressTableTableFilterComposer
    extends Composer<_$AppDatabase, $LevelProgressTableTable> {
  $$LevelProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LevelProgressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LevelProgressTableTable> {
  $$LevelProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LevelProgressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LevelProgressTableTable> {
  $$LevelProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);
}

class $$LevelProgressTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LevelProgressTableTable,
          level_progress,
          $$LevelProgressTableTableFilterComposer,
          $$LevelProgressTableTableOrderingComposer,
          $$LevelProgressTableTableAnnotationComposer,
          $$LevelProgressTableTableCreateCompanionBuilder,
          $$LevelProgressTableTableUpdateCompanionBuilder,
          (
            level_progress,
            BaseReferences<
              _$AppDatabase,
              $LevelProgressTableTable,
              level_progress
            >,
          ),
          level_progress,
          PrefetchHooks Function()
        > {
  $$LevelProgressTableTableTableManager(
    _$AppDatabase db,
    $LevelProgressTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelProgressTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LevelProgressTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> stars = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LevelProgressTableCompanion(
                id: id,
                stars: stars,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int> stars = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LevelProgressTableCompanion.insert(
                id: id,
                stars: stars,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LevelProgressTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LevelProgressTableTable,
      level_progress,
      $$LevelProgressTableTableFilterComposer,
      $$LevelProgressTableTableOrderingComposer,
      $$LevelProgressTableTableAnnotationComposer,
      $$LevelProgressTableTableCreateCompanionBuilder,
      $$LevelProgressTableTableUpdateCompanionBuilder,
      (
        level_progress,
        BaseReferences<_$AppDatabase, $LevelProgressTableTable, level_progress>,
      ),
      level_progress,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LevelProgressTableTableTableManager get levelProgressTable =>
      $$LevelProgressTableTableTableManager(_db, _db.levelProgressTable);
}
