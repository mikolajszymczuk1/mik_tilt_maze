import 'package:mik_tilt_maze/core/cqrs/command.dart';
import 'package:mik_tilt_maze/features/menu/domain/models/level_progress.dart';

class SaveCurrentLevelProgressCommand extends Command<List<LevelProgress>> {
  final List<LevelProgress> progress;
  final String levelId;
  final int stars;

  SaveCurrentLevelProgressCommand({
    required this.progress,
    required this.levelId,
    required this.stars,
  });
}
