import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

abstract class IMazeGeneratorService {
  MazeLevel generate({required int rows, required int cols});
}
