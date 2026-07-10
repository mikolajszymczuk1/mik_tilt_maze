import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/maze_component.dart';

class MazeGame extends FlameGame with HasCollisionDetection, PanDetector {
  final MazeLevel level;

  MazeGame({required this.level});

  late MazeComponent mazeComponent;

  static const double _dragStartThreshold = 10;
  static const double _dragStopThreshold = 4;

  Vector2? _panStart;
  Vector2 dragDirection = Vector2.zero();
  bool _isDragging = false;

  @override
  Color backgroundColor() => const Color.fromARGB(255, 0, 0, 0);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    mazeComponent = MazeComponent(level: level);
    await add(mazeComponent);
  }

  @override
  void onPanStart(DragStartInfo info) {
    _panStart = info.eventPosition.widget.clone();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    final panStart = _panStart;
    if (panStart == null) return;

    final offset = info.eventPosition.widget - panStart;
    final length = offset.length;

    if (_isDragging) {
      if (length < _dragStopThreshold) {
        _isDragging = false;
        dragDirection = Vector2.zero();
      } else {
        dragDirection = offset.normalized();
      }
    } else if (length >= _dragStartThreshold) {
      _isDragging = true;
      dragDirection = offset.normalized();
    }
  }

  @override
  void onPanEnd(DragEndInfo info) {
    _panStart = null;
    _isDragging = false;
    dragDirection = Vector2.zero();
  }

  @override
  void onPanCancel() {
    _panStart = null;
    _isDragging = false;
    dragDirection = Vector2.zero();
  }
}
