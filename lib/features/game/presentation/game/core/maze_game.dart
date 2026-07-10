import 'dart:ui';

import 'package:flame/game.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/maze_component.dart';

class MazeGame extends FlameGame with HasCollisionDetection {
  final MazeLevel level;

  MazeGame({required this.level});

  late MazeComponent mazeComponent;

  @override
  Color backgroundColor() => const Color(0xFF1A1A1A);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    mazeComponent = MazeComponent(level: level);
    await add(mazeComponent);
  }
}
