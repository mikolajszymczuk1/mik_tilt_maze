import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/features/menu/infrastructure/drift/level_progress_table.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@injectable
@DriftDatabase(tables: [LevelProgressTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([@ignoreParam QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(
    name: 'mik_tilt_maze_db',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}
