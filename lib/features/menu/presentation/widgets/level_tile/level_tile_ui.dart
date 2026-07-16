import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class LevelTileUi extends StatelessWidget {
  final int levelNumber;
  final bool isLocked;
  final void Function()? onTap;

  const LevelTileUi({
    super.key,
    required this.levelNumber,
    this.isLocked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: isLocked ? null : onTap,
    borderRadius: BorderRadius.circular(context.spacing.mdLg),
    child: Container(
      decoration: BoxDecoration(
        color: context.colors.accentLight,
        border: Border.all(color: context.colors.surface1),
        borderRadius: BorderRadius.circular(context.spacing.mdLg),
      ),
      alignment: Alignment.center,
      child: isLocked
          ? BaseIcon(
              name: BaseIconName.lock,
              color: context.colors.textPrimary.withValues(alpha: 0.4),
            )
          : BaseText('$levelNumber', type: BaseTextType.large),
    ),
  );
}
