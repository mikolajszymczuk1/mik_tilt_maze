import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/maze_game.dart';

class PlayerComponent extends PositionComponent
    with CollisionCallbacks, HasGameReference<MazeGame> {
  static const double _speed = 220;
  static const double _radius = 12;

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

    final direction = game.dragDirection;
    if (direction.isZero()) return;

    final delta = direction * _speed * dt;

    _tryMove(Vector2(delta.x, 0));
    _tryMove(Vector2(0, delta.y));
  }

  void _tryMove(Vector2 delta) {
    final candidate = position + delta;
    if (!_collidesAt(candidate)) {
      position.setFrom(candidate);
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
    final paint = Paint()..color = const Color.fromARGB(255, 13, 255, 74);
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }
}
