import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/domain/models/wall_segment.dart';
import 'package:mik_tilt_maze/features/game/domain/services/i_wall_segment_builder_service.dart';
import 'package:mik_tilt_maze/features/game/infrastructure/services/wall_segment_builder_service.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/goal_component.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/player_component.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/target_component.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';

class MazeComponent extends PositionComponent {
  final MazeLevel level;
  late double cellSize;

  static const double wallThicknessRatio = 0.1;
  static const double _outerCornerRadius = 16;

  final IWallSegmentBuilderService _wallSegmentBuilder =
      WallSegmentBuilderService();

  late final List<WallSegment> _wallSegments = _wallSegmentBuilder.build(level);

  final List<RectangleHitbox> _wallHitboxes = [];

  final List<Rect> _wallRects = [];

  final PlayerComponent _player = PlayerComponent();

  bool _playerPlaced = false;

  late final List<TargetComponent> _targets = level.targets
      .map((pos) => TargetComponent(gridPos: pos))
      .toList();

  late final GoalComponent _goal = GoalComponent(gridPos: level.goal);

  bool _targetsAndGoalPlaced = false;

  MazeComponent({required this.level});

  List<Rect> get wallRects => _wallRects;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    for (final _ in _wallSegments) {
      final hitbox = RectangleHitbox(collisionType: CollisionType.passive);
      _wallHitboxes.add(hitbox);
      await add(hitbox);
    }

    await addAll(_targets);
    await add(_goal);
    await add(_player);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    cellSize = math.min(size.x / level.cols, size.y / level.rows);

    final mazeWidth = cellSize * level.cols;
    final mazeHeight = cellSize * level.rows;

    this.size = Vector2(mazeWidth, mazeHeight);
    position = Vector2((size.x - mazeWidth) / 2, (size.y - mazeHeight) / 2);

    _layoutWallHitboxes();
    _layoutPlayer();
    _layoutTargetsAndGoal();
  }

  void _layoutPlayer() {
    if (_playerPlaced) return;

    _player.position = Vector2(
      (level.ballStart.col + 0.5) * cellSize,
      (level.ballStart.row + 0.5) * cellSize,
    );
    _playerPlaced = true;
  }

  void _layoutTargetsAndGoal() {
    if (_targetsAndGoalPlaced) return;

    for (final target in _targets) {
      target.position = Vector2(
        (target.gridPos.col + 0.5) * cellSize,
        (target.gridPos.row + 0.5) * cellSize,
      );
    }

    _goal.position = Vector2(
      (level.goal.col + 0.5) * cellSize,
      (level.goal.row + 0.5) * cellSize,
    );
    _targetsAndGoalPlaced = true;
  }

  void _layoutWallHitboxes() {
    if (_wallHitboxes.isEmpty) return;

    final wallThickness = cellSize * wallThicknessRatio;
    _wallRects.clear();

    for (var i = 0; i < _wallSegments.length; i++) {
      final segment = _wallSegments[i];
      final hitbox = _wallHitboxes[i];
      final length = (segment.end - segment.start) * cellSize + wallThickness;

      final Vector2 hitboxPosition;
      final Vector2 hitboxSize;
      if (segment.horizontal) {
        hitboxPosition = Vector2(
          segment.start * cellSize - wallThickness / 2,
          segment.line * cellSize - wallThickness / 2,
        );
        hitboxSize = Vector2(length, wallThickness);
      } else {
        hitboxPosition = Vector2(
          segment.line * cellSize - wallThickness / 2,
          segment.start * cellSize - wallThickness / 2,
        );
        hitboxSize = Vector2(wallThickness, length);
      }

      hitbox
        ..position = hitboxPosition
        ..size = hitboxSize;
      _wallRects.add(
        Rect.fromLTWH(
          hitboxPosition.x,
          hitboxPosition.y,
          hitboxSize.x,
          hitboxSize.y,
        ),
      );
    }
  }

  @override
  void render(Canvas canvas) {
    final wallThickness = cellSize * wallThicknessRatio;

    final paint = Paint()
      ..color = AppColors.textPrimary
      ..strokeWidth = wallThickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final inset = wallThickness / 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          inset,
          inset,
          size.x - wallThickness,
          size.y - wallThickness,
        ),
        const Radius.circular(_outerCornerRadius),
      ),
      paint,
    );

    for (var r = 0; r < level.rows; r++) {
      for (var c = 0; c < level.cols; c++) {
        final cell = level.grid[r][c];
        final x = c * cellSize;
        final y = r * cellSize;

        if (cell.wallN && r > 0) {
          canvas.drawLine(Offset(x, y), Offset(x + cellSize, y), paint);
        }

        if (cell.wallW && c > 0) {
          canvas.drawLine(Offset(x, y), Offset(x, y + cellSize), paint);
        }
      }
    }
  }
}
