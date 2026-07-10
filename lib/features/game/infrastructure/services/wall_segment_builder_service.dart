import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/domain/models/wall_segment.dart';
import 'package:mik_tilt_maze/features/game/domain/services/i_wall_segment_builder_service.dart';

class WallSegmentBuilderService implements IWallSegmentBuilderService {
  @override
  List<WallSegment> build(MazeLevel level) => [
    ..._buildLines(
      lineCount: level.rows + 1,
      cellCount: level.cols,
      hasWall: (line, cell) => _hasHorizontalWall(level, line, cell),
      horizontal: true,
    ),
    ..._buildLines(
      lineCount: level.cols + 1,
      cellCount: level.rows,
      hasWall: (line, cell) => _hasVerticalWall(level, cell, line),
      horizontal: false,
    ),
  ];

  List<WallSegment> _buildLines({
    required int lineCount,
    required int cellCount,
    required bool Function(int line, int cell) hasWall,
    required bool horizontal,
  }) {
    final segments = <WallSegment>[];

    for (var line = 0; line < lineCount; line++) {
      int? runStart;

      for (var cell = 0; cell < cellCount; cell++) {
        if (hasWall(line, cell)) {
          runStart ??= cell;
        } else if (runStart != null) {
          segments.add(
            WallSegment(
              horizontal: horizontal,
              line: line,
              start: runStart,
              end: cell,
            ),
          );
          runStart = null;
        }
      }

      if (runStart != null) {
        segments.add(
          WallSegment(
            horizontal: horizontal,
            line: line,
            start: runStart,
            end: cellCount,
          ),
        );
      }
    }

    return segments;
  }

  bool _hasHorizontalWall(MazeLevel level, int r, int c) {
    if (r == 0) return level.grid[0][c].wallN;
    if (r == level.rows) return level.grid[level.rows - 1][c].wallS;
    return level.grid[r - 1][c].wallS || level.grid[r][c].wallN;
  }

  bool _hasVerticalWall(MazeLevel level, int r, int c) {
    if (c == 0) return level.grid[r][0].wallW;
    if (c == level.cols) return level.grid[r][level.cols - 1].wallE;
    return level.grid[r][c - 1].wallE || level.grid[r][c].wallW;
  }
}
