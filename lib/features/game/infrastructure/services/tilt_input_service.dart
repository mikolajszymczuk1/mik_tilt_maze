import 'dart:async';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:mik_tilt_maze/features/game/domain/services/i_tilt_input_service.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TiltInputService implements ITiltInputService {
  static const double _maxTilt = 4;
  static const double _deadZone = 0.6;
  static const double _smoothingFactor = 0.35;

  final StreamController<Vector2> _controller =
      StreamController<Vector2>.broadcast();
  StreamSubscription<AccelerometerEvent>? _subscription;

  double _smoothedX = 0;
  double _smoothedY = 0;

  TiltInputService() {
    _subscription = accelerometerEventStream(
      samplingPeriod: SensorInterval.gameInterval,
    ).listen(_onEvent);
  }

  @override
  Stream<Vector2> get tiltStream => _controller.stream;

  void _onEvent(AccelerometerEvent event) {
    _smoothedX += (event.x - _smoothedX) * _smoothingFactor;
    _smoothedY += (event.y - _smoothedY) * _smoothingFactor;

    final dx = -_smoothedX;
    final dy = _smoothedY;

    final magnitude = math.sqrt(dx * dx + dy * dy);
    if (magnitude < _deadZone) {
      _controller.add(Vector2.zero());
      return;
    }

    final strength = ((magnitude - _deadZone) / (_maxTilt - _deadZone)).clamp(
      0.0,
      1.0,
    );
    final direction = Vector2(dx, dy).normalized();

    _controller.add(direction * strength);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
