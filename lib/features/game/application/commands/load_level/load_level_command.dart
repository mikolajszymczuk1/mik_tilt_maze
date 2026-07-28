import 'package:mik_tilt_maze/core/cqrs/command.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

class LoadLevelCommand extends Command<MazeLevel> {
  final String levelName;

  LoadLevelCommand({required this.levelName});
}
