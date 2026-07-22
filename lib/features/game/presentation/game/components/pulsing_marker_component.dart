import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/player_component.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/maze_game.dart';

abstract class PulsingMarkerComponent extends PositionComponent
    with CollisionCallbacks, HasGameReference<MazeGame> {
  static const List<double> _pulsePhases = [0, 0.5];

  final Color color;
  final double dotRadius;
  final double pulseMaxRadius;
  final double pulseDuration;

  bool consumed = false;
  double _time = 0;

  PulsingMarkerComponent({
    required this.color,
    this.dotRadius = 6,
    this.pulseMaxRadius = 18,
    this.pulseDuration = 1.6,
  }) : super(size: Vector2.all(pulseMaxRadius * 2), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(
      CircleHitbox(radius: dotRadius, collisionType: CollisionType.passive),
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      onPlayerReached();
    }
  }

  void onPlayerReached();

  @override
  void update(double dt) {
    super.update(dt);
    _time += dt;
  }

  @override
  void render(Canvas canvas) {
    final center = Offset(size.x / 2, size.y / 2);

    for (final phase in _pulsePhases) {
      final progress = ((_time / pulseDuration) + phase) % 1.0;
      final radius = dotRadius + (pulseMaxRadius - dotRadius) * progress;
      final opacity = (1 - progress).clamp(0.0, 1.0);

      final ringPaint = Paint()
        ..color = color.withValues(alpha: opacity * 0.6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(center, radius, ringPaint);
    }

    final dotPaint = Paint()..color = color;
    canvas.drawCircle(center, dotRadius, dotPaint);
  }
}
