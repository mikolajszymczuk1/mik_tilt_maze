import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class LevelTileUi extends StatelessWidget {
  final int levelNumber;
  final bool isLocked;
  final int stars;
  final void Function()? onTap;

  const LevelTileUi({
    super.key,
    required this.levelNumber,
    this.isLocked = false,
    this.stars = 0,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseText('$levelNumber', type: BaseTextType.large),
          Gap(context.spacing.xs),
          isLocked
              ? BaseIcon(
                  name: BaseIconName.lock,
                  color: context.colors.textPrimary.withValues(alpha: 0.4),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    3,
                    (index) => BaseIcon(
                      name: index < stars
                          ? BaseIconName.starFull
                          : BaseIconName.starEmpty,
                      color: context.colors.accentYellow,
                    ),
                  ),
                ),
        ],
      ),
    ),
  );
}
