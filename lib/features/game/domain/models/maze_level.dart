import 'package:mik_tilt_maze/features/game/domain/models/grid_pos.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_cell.dart';

class MazeLevel {
  final String id;
  final int rows;
  final int cols;
  final List<List<MazeCell>> grid;
  final GridPos ballStart;
  final List<GridPos> targets;
  final GridPos goal;

  MazeLevel({
    required this.id,
    required this.rows,
    required this.cols,
    required this.grid,
    required this.ballStart,
    required this.targets,
    required this.goal,
  });

  factory MazeLevel.fromJson(Map<String, dynamic> json) {
    final rows = json['rows'] as int;
    final cols = json['cols'] as int;
    final rawWalls = json['cell_walls'] as List;

    final grid = List.generate(rows, (r) {
      final rowData = rawWalls[r] as List;
      return List.generate(
        cols,
        (c) => MazeCell.fromString(rowData[c] as String),
      );
    });

    GridPos parsePos(Map<String, dynamic> m) =>
        GridPos(m['row'] as int, m['col'] as int);

    return MazeLevel(
      id: json['id'] as String,
      rows: rows,
      cols: cols,
      grid: grid,
      ballStart: parsePos(json['ball_start']),
      targets: (json['targets'] as List)
          .map((t) => parsePos(t as Map<String, dynamic>))
          .toList(),
      goal: parsePos(json['goal']),
    );
  }
}
