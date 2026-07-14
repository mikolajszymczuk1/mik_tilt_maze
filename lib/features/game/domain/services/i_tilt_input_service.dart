import 'package:flame/components.dart';

abstract interface class ITiltInputService {
  Stream<Vector2> get tiltStream;

  void dispose();
}
