import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/level_tile/level_tile_ui.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_icon_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/nav/base_top_navigation_bar.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

const _levelsCount = 10;
const _tilesPerRow = 3;

class CampaignPage extends StatelessWidget {
  const CampaignPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.surface0,
    appBar: BaseTopNavigationBar(
      children: [
        BaseIconButton(icon: BaseIconName.back, onPressed: () => context.pop()),
        Gap(context.spacing.xs),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseText('Levels'),
            BaseText('Discover new things', type: BaseTextType.tiny),
          ],
        ),
      ],
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(context.spacing.lg),
        child: GridView.builder(
          itemCount: _levelsCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _tilesPerRow,
            crossAxisSpacing: context.spacing.sm,
            mainAxisSpacing: context.spacing.sm,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final levelNumber = index + 1;
            return LevelTileUi(
              levelNumber: levelNumber,
              isLocked: levelNumber > 3,
              onTap: () => context.pushNamed('game'),
            );
          },
        ),
      ),
    ),
  );
}
