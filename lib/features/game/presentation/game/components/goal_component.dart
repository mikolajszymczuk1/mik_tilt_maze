import 'package:mik_tilt_maze/features/game/domain/models/grid_pos.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/burst_effect_component.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/pulsing_marker_component.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/ring_pulse_effect_component.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';

class GoalComponent extends PulsingMarkerComponent {
  final GridPos gridPos;

  GoalComponent({required this.gridPos})
    : super(color: AppColors.accentRed, hitboxRadius: 4);

  @override
  void onPlayerReached() {
    if (consumed) return;
    consumed = true;
    parent?.addAll([
      RingPulseEffectComponent(position: position.clone(), color: color),
      BurstEffectComponent(
        position: position.clone(),
        colors: const [
          AppColors.accentRed,
          AppColors.accentYellow,
          AppColors.accentPurple,
        ],
        particleCount: 24,
        speed: 130,
        particleRadius: 4,
        lifespan: 0.7,
      ),
    ]);
    game.completeLevel();
  }
}
