import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

class MazeComponent extends PositionComponent {
  final MazeLevel level;
  late double cellSize;

  double _testSquareX = 0;
  double _testSquareSpeed = 80;

  final Paint _testPaint = Paint()..color = const Color(0xFFE53E3E);

  MazeComponent({required this.level});

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    cellSize = math.min(size.x / level.cols, size.y / level.rows);

    final mazeWidth = cellSize * level.cols;
    final mazeHeight = cellSize * level.rows;

    this.size = Vector2(mazeWidth, mazeHeight);
    position = Vector2((size.x - mazeWidth) / 2, (size.y - mazeHeight) / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _testSquareX += _testSquareSpeed * dt;
    if (_testSquareX + 40 > size.x || _testSquareX < 0) {
      _testSquareSpeed = -_testSquareSpeed;
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(_testSquareX, 20, 40, 40), _testPaint);
  }
}
