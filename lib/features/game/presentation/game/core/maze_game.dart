import 'dart:async';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/domain/services/i_tilt_input_service.dart';
import 'package:mik_tilt_maze/features/game/infrastructure/services/tilt_input_service.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/maze_component.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final MazeLevel level;

  MazeGame({required this.level});

  late MazeComponent mazeComponent;

  final ITiltInputService _tiltInputService = TiltInputService();
  StreamSubscription<Vector2>? _tiltSubscription;
  Vector2 tiltVector = Vector2.zero();

  @override
  Color backgroundColor() => const Color.fromARGB(255, 0, 0, 0);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    mazeComponent = MazeComponent(level: level);
    await add(mazeComponent);

    _tiltSubscription = _tiltInputService.tiltStream.listen((tilt) {
      tiltVector = tilt;
    });
  }

  @override
  void onRemove() {
    _tiltSubscription?.cancel();
    _tiltInputService.dispose();
    super.onRemove();
  }
}
