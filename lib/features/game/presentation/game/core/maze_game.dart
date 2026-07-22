import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show KeyEventResult;
import 'package:mik_tilt_maze/features/game/domain/models/grid_pos.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/domain/services/i_tilt_input_service.dart';
import 'package:mik_tilt_maze/features/game/infrastructure/services/tilt_input_service.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/maze_component.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/debug_config.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';

class MazeGame extends FlameGame with HasCollisionDetection, KeyboardEvents {
  final MazeLevel level;
  final void Function(GridPos pos)? onTargetCollected;
  final void Function()? onGoalReached;

  MazeGame({required this.level, this.onTargetCollected, this.onGoalReached});

  late MazeComponent mazeComponent;

  final ITiltInputService _tiltInputService = TiltInputService();
  StreamSubscription<Vector2>? _tiltSubscription;
  Vector2 tiltVector = Vector2.zero();

  final Set<LogicalKeyboardKey> _pressedKeys = {};

  final Set<GridPos> collectedTargets = {};
  bool isLevelCompleted = false;

  void collectTarget(GridPos pos) {
    collectedTargets.add(pos);
    onTargetCollected?.call(pos);
  }

  void completeLevel() {
    if (isLevelCompleted) return;
    isLevelCompleted = true;
    onGoalReached?.call();
  }

  @override
  Color backgroundColor() => AppColors.accentLight;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    mazeComponent = MazeComponent(level: level);
    await add(mazeComponent);

    _tiltSubscription = _tiltInputService.tiltStream.listen((tilt) {
      if (!DebugConfig.useKeyboardControls) {
        tiltVector = tilt;
      }
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (DebugConfig.useKeyboardControls) {
      tiltVector = _keyboardTiltVector();
    }
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    _pressedKeys
      ..clear()
      ..addAll(keysPressed);
    return KeyEventResult.handled;
  }

  Vector2 _keyboardTiltVector() {
    var x = 0.0;
    var y = 0.0;
    if (_pressedKeys.contains(LogicalKeyboardKey.arrowLeft)) x -= 1;
    if (_pressedKeys.contains(LogicalKeyboardKey.arrowRight)) x += 1;
    if (_pressedKeys.contains(LogicalKeyboardKey.arrowUp)) y -= 1;
    if (_pressedKeys.contains(LogicalKeyboardKey.arrowDown)) y += 1;

    final vector = Vector2(x, y);
    return vector.isZero() ? vector : vector.normalized();
  }

  @override
  void onRemove() {
    _tiltSubscription?.cancel();
    _tiltInputService.dispose();
    super.onRemove();
  }
}
