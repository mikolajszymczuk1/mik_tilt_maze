import 'package:mik_tilt_maze/features/game/domain/models/grid_pos.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/components/pulsing_marker_component.dart';
import 'package:mik_tilt_maze/shared/theme/app_colors.dart';

class GoalComponent extends PulsingMarkerComponent {
  final GridPos gridPos;

  GoalComponent({required this.gridPos})
    : super(color: AppColors.accentRed, hitboxRadius: 1);

  @override
  void onPlayerReached() {
    if (consumed) return;
    consumed = true;
    game.completeLevel();
  }
}
