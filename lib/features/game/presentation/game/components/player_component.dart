import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/maze_game.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';

class PlayerComponent extends PositionComponent
    with CollisionCallbacks, HasGameReference<MazeGame> {
  static const double _radius = 12;
  static const double _acceleration = 1300;
  static const double _friction = 0.12;
  static const double _maxSpeed = 300;

  final Vector2 _velocity = Vector2.zero();

  PlayerComponent()
    : super(size: Vector2.all(_radius * 2), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(CircleHitbox(collisionType: CollisionType.active));
  }

  @override
  void update(double dt) {
    super.update(dt);

    final tilt = game.tiltVector;
    _velocity.add(tilt * _acceleration * dt);

    final frictionFactor = math.pow(_friction, dt).toDouble();
    _velocity.scale(frictionFactor);

    if (_velocity.length > _maxSpeed) {
      _velocity.scaleTo(_maxSpeed);
    }

    if (_velocity.isZero()) return;

    final delta = _velocity * dt;

    _tryMove(Vector2(delta.x, 0), axisX: true);
    _tryMove(Vector2(0, delta.y), axisX: false);
  }

  void _tryMove(Vector2 delta, {required bool axisX}) {
    final candidate = position + delta;
    if (!_collidesAt(candidate)) {
      position.setFrom(candidate);
    } else if (axisX) {
      _velocity.x = 0;
    } else {
      _velocity.y = 0;
    }
  }

  bool _collidesAt(Vector2 center) {
    for (final wall in game.mazeComponent.wallRects) {
      if (_circleOverlapsRect(center, _radius, wall)) {
        return true;
      }
    }
    return false;
  }

  bool _circleOverlapsRect(Vector2 center, double radius, Rect rect) {
    final closestX = center.x.clamp(rect.left, rect.right);
    final closestY = center.y.clamp(rect.top, rect.bottom);
    final dx = center.x - closestX;
    final dy = center.y - closestY;
    return dx * dx + dy * dy < radius * radius;
  }

  @override
  void render(Canvas canvas) {
    final radius = size.x / 2;
    final paint = Paint()..color = AppColors.accentPurple;
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }
}
