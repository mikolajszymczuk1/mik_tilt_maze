import 'package:drift/drift.dart';

@DataClassName('level_progress')
class LevelProgressTable extends Table {
  late final id = text()();
  late final stars = integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
