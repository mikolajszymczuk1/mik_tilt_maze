import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/game/bloc/game_bloc.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/maze_game.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/information_toast/information_toast_ui.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_icon_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/nav/base_top_navigation_bar.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    context.read<GameBloc>().add(const GameEvent.something());
    context.read<GameBloc>().add(const GameEvent.loadLevel('easy', 'easy_01'));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: BaseTopNavigationBar(
      children: [
        BaseIconButton(
          icon: BaseIconName.pause,
          onPressed: () => context.pop(),
        ),
        Gap(context.spacing.xs),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseText('Level 1'),
            BaseText('Not completed', type: BaseTextType.tiny),
          ],
        ),
      ],
    ),
    backgroundColor: context.colors.surface0,
    body: SafeArea(
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, gameState) {
          final level = gameState.currentLevel;
          if (level == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final mazeSize = MediaQuery.of(context).size.width - 48;

          return Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(context.spacing.sm),
                  decoration: BoxDecoration(
                    color: context.colors.accentLight,
                    border: Border.all(color: context.colors.surface1),
                    borderRadius: BorderRadius.circular(context.spacing.lg),
                  ),
                  width: mazeSize,
                  height: mazeSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(context.spacing.md),
                    child: GameWidget(game: MazeGame(level: level)),
                  ),
                ),
                const Spacer(),
                const InformationToastUi(
                  value: 'Tilt your phone to move',
                  icon: BaseIconName.mobile,
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
