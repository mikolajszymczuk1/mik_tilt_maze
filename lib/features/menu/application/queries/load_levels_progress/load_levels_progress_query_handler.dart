import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/cqrs/handler.dart';
import 'package:mik_tilt_maze/features/menu/application/queries/load_levels_progress/load_levels_progress_query.dart';
import 'package:mik_tilt_maze/features/menu/domain/models/level_progress.dart';
import 'package:mik_tilt_maze/shared/infrastructure/database/database.dart';

@injectable
class LoadLevelsProgressQueryHandler
    implements QueryHandler<LoadLevelsProgressQuery, List<LevelProgress>> {
  final AppDatabase _database;

  LoadLevelsProgressQueryHandler(this._database);

  @override
  Future<List<LevelProgress>> handle(LoadLevelsProgressQuery query) async {
    final rows = await _database.select(_database.levelProgressTable).get();
    final progress = rows
        .map((row) => LevelProgress(levelId: row.id, stars: row.stars))
        .toList();

    return progress;
  }
}
