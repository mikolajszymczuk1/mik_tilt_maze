import 'dart:ui';

import 'package:flame/components.dart';

class RingPulseEffectComponent extends PositionComponent {
  final Color color;
  final double maxRadius;
  final double duration;
  final double strokeWidth;

  double _time = 0;

  RingPulseEffectComponent({
    required Vector2 position,
    required this.color,
    this.maxRadius = 60,
    this.duration = 0.6,
    this.strokeWidth = 4,
  }) : super(position: position);

  @override
  void update(double dt) {
    super.update(dt);
    _time += dt;
    if (_time >= duration) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final progress = (_time / duration).clamp(0.0, 1.0);
    final radius = maxRadius * progress;
    final opacity = (1 - progress).clamp(0.0, 1.0);

    final paint = Paint()
      ..color = color.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * (1 - progress * 0.6);

    canvas.drawCircle(Offset.zero, radius, paint);
  }
}
