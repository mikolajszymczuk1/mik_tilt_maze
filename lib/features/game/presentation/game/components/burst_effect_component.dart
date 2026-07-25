import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';

class BurstEffectComponent extends ParticleSystemComponent {
  BurstEffectComponent({
    required Vector2 position,
    required List<Color> colors,
    int particleCount = 12,
    double speed = 80,
    double particleRadius = 3,
    double lifespan = 0.45,
  }) : super(
         position: position,
         particle: Particle.generate(
           count: particleCount,
           lifespan: lifespan,
           generator: (i) {
             final angle = (2 * math.pi * i) / particleCount;
             final direction = Vector2(math.cos(angle), math.sin(angle));
             final color = colors[i % colors.length];
             return ComputedParticle(
               renderer: (canvas, particle) {
                 final t = particle.progress;
                 final offset = direction * speed * t * lifespan;
                 final radius = particleRadius * (1 - t * 0.5);
                 final paint = Paint()
                   ..color = color.withValues(alpha: (1 - t).clamp(0.0, 1.0));
                 canvas.drawCircle(Offset(offset.x, offset.y), radius, paint);
               },
             );
           },
         ),
       );
}
