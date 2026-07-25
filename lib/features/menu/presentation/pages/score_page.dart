import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/bloc/menu_bloc.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class ScorePage extends StatelessWidget {
  final int stars;
  final String levelId;

  const ScorePage({super.key, required this.stars, required this.levelId});

  void _handleGoToLevels(BuildContext context) {
    context.goNamed('campaign', queryParameters: {'from_game': 'true'});
  }

  void _handleRestartGame(BuildContext context) {
    context.pushNamed('game', pathParameters: {'level_id': levelId});
  }

  void _handleNextLevel(BuildContext context) {
    final levelsCount = context.read<MenuBloc>().state.loadedLevelsIds.length;
    final randomLevelNumber = Random().nextInt(levelsCount) + 1;
    final nextLevelId = 'level_$randomLevelNumber';
    context.pushNamed('game', pathParameters: {'level_id': nextLevelId});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.surface0,
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BaseText('Complete!', type: BaseTextType.huge),
                    BaseText(
                      'You guided the ball home',
                      color: context.colors.textPrimary.withValues(alpha: 0.8),
                      type: BaseTextType.tiny,
                    ),
                    Gap(context.spacing.md),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: context.spacing.sm,
                      children: List.generate(
                        3,
                        (index) => BaseIcon(
                          name: index < stars
                              ? BaseIconName.starFull
                              : BaseIconName.starEmpty,
                          color: context.colors.accentYellow,
                          size: BaseIconSize.huge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BaseButton(
              icon: BaseIconName.play,
              text: 'Next level',
              withoutIconContainer: true,
              isHighlighted: true,
              textCenter: true,
              onPressed: () => _handleNextLevel(context),
            ),
            Gap(context.spacing.sm),
            Row(
              spacing: context.spacing.sm,
              children: [
                Expanded(
                  child: BaseButton(
                    icon: BaseIconName.rotate,
                    text: 'Restart',
                    withoutIconContainer: true,
                    textCenter: true,
                    onPressed: () => _handleRestartGame(context),
                  ),
                ),
                Expanded(
                  child: BaseButton(
                    icon: BaseIconName.compass,
                    text: 'Go to levels',
                    withoutIconContainer: true,
                    textCenter: true,
                    onPressed: () => _handleGoToLevels(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
