import 'package:mik_tilt_maze/core/cqrs/command.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

class GenerateRandomLevelCommand extends Command<MazeLevel> {
  final int rows;
  final int cols;

  GenerateRandomLevelCommand({this.rows = 6, this.cols = 6});
}
