import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/cqrs/handler.dart';
import 'package:mik_tilt_maze/features/menu/application/commands/save_current_level_progress/save_current_level_progress_command.dart';
import 'package:mik_tilt_maze/features/menu/domain/models/level_progress.dart';
import 'package:mik_tilt_maze/shared/infrastructure/database/database.dart';

@injectable
class SaveCurrentLevelProgressCommandHandler
    implements
        CommandHandler<SaveCurrentLevelProgressCommand, List<LevelProgress>> {
  final AppDatabase _database;

  SaveCurrentLevelProgressCommandHandler(this._database);

  @override
  Future<List<LevelProgress>> handle(
    SaveCurrentLevelProgressCommand command,
  ) async {
    for (final progress in command.progress) {
      if (progress.levelId == command.levelId &&
          command.stars <= progress.stars) {
        return command.progress;
      }
    }

    final progressToAdd = LevelProgress(
      levelId: command.levelId,
      stars: command.stars,
    );

    final updatedProgress = [
      ...command.progress.where(
        (progress) => progress.levelId != command.levelId,
      ),
      progressToAdd,
    ];

    await _database
        .into(_database.levelProgressTable)
        .insertOnConflictUpdate(
          LevelProgressTableCompanion.insert(
            id: command.levelId,
            stars: Value(command.stars),
          ),
        );

    return updatedProgress;
  }
}
