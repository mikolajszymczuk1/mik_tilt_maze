import 'dart:math';

import 'package:mik_tilt_maze/features/game/domain/models/grid_pos.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_cell.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/domain/services/i_maze_generator_service.dart';

class MazeGeneratorService implements IMazeGeneratorService {
  static const int _targetCount = 3;

  final Random _random;

  MazeGeneratorService({Random? random}) : _random = random ?? Random();

  @override
  MazeLevel generate({required int rows, required int cols}) {
    final grid = _carveGrid(rows, cols);
    final positions = _pickDistinctPositions(rows, cols, 2 + _targetCount);

    return MazeLevel(
      id: 'quick_play',
      rows: rows,
      cols: cols,
      grid: grid,
      ballStart: positions[0],
      goal: positions[1],
      targets: positions.sublist(2),
    );
  }

  List<List<MazeCell>> _carveGrid(int rows, int cols) {
    final grid = List.generate(
      rows,
      (_) => List.generate(
        cols,
        (_) => MazeCell()
          ..wallN = true
          ..wallE = true
          ..wallS = true
          ..wallW = true,
      ),
    );

    final visited = List.generate(rows, (_) => List.filled(cols, false));
    final stack = <GridPos>[];

    final start = GridPos(_random.nextInt(rows), _random.nextInt(cols));
    visited[start.row][start.col] = true;
    stack.add(start);

    while (stack.isNotEmpty) {
      final current = stack.last;
      final neighbors = _unvisitedNeighbors(current, rows, cols, visited);

      if (neighbors.isEmpty) {
        stack.removeLast();
        continue;
      }

      final next = neighbors[_random.nextInt(neighbors.length)];
      _removeWallBetween(grid, current, next);
      visited[next.row][next.col] = true;
      stack.add(next);
    }

    return grid;
  }

  List<GridPos> _unvisitedNeighbors(
    GridPos cell,
    int rows,
    int cols,
    List<List<bool>> visited,
  ) {
    final candidates = [
      GridPos(cell.row - 1, cell.col),
      GridPos(cell.row + 1, cell.col),
      GridPos(cell.row, cell.col - 1),
      GridPos(cell.row, cell.col + 1),
    ];

    return candidates
        .where(
          (pos) =>
              pos.row >= 0 &&
              pos.row < rows &&
              pos.col >= 0 &&
              pos.col < cols &&
              !visited[pos.row][pos.col],
        )
        .toList();
  }

  void _removeWallBetween(List<List<MazeCell>> grid, GridPos a, GridPos b) {
    final cellA = grid[a.row][a.col];
    final cellB = grid[b.row][b.col];

    if (b.row == a.row - 1) {
      cellA.wallN = false;
      cellB.wallS = false;
    } else if (b.row == a.row + 1) {
      cellA.wallS = false;
      cellB.wallN = false;
    } else if (b.col == a.col - 1) {
      cellA.wallW = false;
      cellB.wallE = false;
    } else {
      cellA.wallE = false;
      cellB.wallW = false;
    }
  }

  List<GridPos> _pickDistinctPositions(int rows, int cols, int count) {
    final all = [
      for (var r = 0; r < rows; r++)
        for (var c = 0; c < cols; c++) GridPos(r, c),
    ];
    all.shuffle(_random);
    return all.sublist(0, count);
  }
}
