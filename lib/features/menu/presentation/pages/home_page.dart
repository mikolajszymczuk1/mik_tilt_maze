import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/stars_counter/stars_counter_ui.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/nav/base_top_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToGame(BuildContext context) {
    context.pushNamed('game');
  }

  void _goToCampaign(BuildContext context) {
    context.pushNamed('campaign');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.surface0,
    appBar: const BaseTopNavigationBar(children: [StarsCounterUi(value: '36')]),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          children: [
            const Spacer(),
            Column(
              spacing: context.spacing.sm,
              children: [
                BaseButton(
                  text: 'Continue',
                  subText: 'Level 5',
                  icon: BaseIconName.play,
                  isHighlighted: true,
                  onPressed: () => _goToGame(context),
                ),
                BaseButton(
                  text: 'Campaign',
                  subText: 'Discover amazing levels',
                  icon: BaseIconName.compass,
                  onPressed: () => _goToCampaign(context),
                ),
                const BaseButton(
                  text: 'Quick Play',
                  subText: 'Play random generated level',
                  icon: BaseIconName.dice,
                ),
                Row(
                  spacing: context.spacing.sm,
                  children: const [
                    Expanded(
                      child: BaseButton(
                        subText: 'How to play',
                        icon: BaseIconName.question,
                        withoutIconContainer: true,
                      ),
                    ),
                    Expanded(
                      child: BaseButton(
                        subText: 'Settings',
                        icon: BaseIconName.gear,
                        withoutIconContainer: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
