import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/domain/models/wall_segment.dart';

abstract class IWallSegmentBuilderService {
  List<WallSegment> build(MazeLevel level);
}
