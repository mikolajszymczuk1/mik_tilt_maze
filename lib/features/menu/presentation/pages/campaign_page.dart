import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/bloc/menu_bloc.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/level_tile/level_tile_ui.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_icon_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/nav/base_top_navigation_bar.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  @override
  void initState() {
    super.initState();
    final menuBloc = context.read<MenuBloc>();
    if (menuBloc.state.loadedLevelsIds.isNotEmpty) {
      return;
    }

    menuBloc.add(const MenuEvent.loadLevelsMetadata());
  }

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
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, menuState) {
          if (menuState.loadedLevelsIds.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  '12 / 20 completed',
                  type: BaseTextType.tiny,
                  color: context.colors.textPrimary.withValues(alpha: 0.8),
                ),
                Gap(context.spacing.sm),
                Expanded(
                  child: GridView.builder(
                    itemCount: menuState.loadedLevelsIds.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: context.spacing.sm,
                      mainAxisSpacing: context.spacing.sm,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final levelId = menuState.loadedLevelsIds[index];
                      final levelNumber = index + 1;
                      return LevelTileUi(
                        levelNumber: levelNumber,
                        isLocked: false,
                        stars: 0,
                        onTap: () => context.pushNamed(
                          'game',
                          pathParameters: {'level_id': levelId},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
