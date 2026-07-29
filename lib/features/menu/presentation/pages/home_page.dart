import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/bloc/menu_bloc.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/stars_counter/stars_counter_ui.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/nav/base_top_navigation_bar.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToCampaign(BuildContext context) {
    context.pushNamed('campaign');
  }

  void _handleQuickPlay(BuildContext context) {
    context.pushNamed('gameQuickPlay');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.surface0,
    appBar: BaseTopNavigationBar(
      children: [
        StarsCounterUi(
          value: context.read<MenuBloc>().state.totalStars.toString(),
        ),
      ],
    ),
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
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colors.accentLight,
                        borderRadius: BorderRadius.circular(context.spacing.lg),
                        border: Border.all(color: context.colors.surface1),
                      ),
                      child: SvgPicture.asset('assets/icons/Logo.svg'),
                    ),
                    Gap(context.spacing.sm),
                    const BaseText('MIK TILT MAZE', type: BaseTextType.huge),
                    BaseText(
                      'Tilt to roll. Guide the ball home',
                      type: BaseTextType.tiny,
                      color: context.colors.textPrimary.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            Column(
              spacing: context.spacing.sm,
              children: [
                BaseButton(
                  text: 'Campaign',
                  subText: 'Discover amazing levels',
                  isHighlighted: true,
                  icon: BaseIconName.compass,
                  onPressed: () => _goToCampaign(context),
                ),
                BaseButton(
                  text: 'Quick Play',
                  subText: 'Play random generated level',
                  icon: BaseIconName.dice,
                  onPressed: () => _handleQuickPlay(context),
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
