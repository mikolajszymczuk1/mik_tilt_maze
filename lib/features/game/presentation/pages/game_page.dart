import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/game/bloc/game_bloc.dart';
import 'package:mik_tilt_maze/features/game/domain/models/grid_pos.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/maze_game.dart';
import 'package:mik_tilt_maze/features/menu/bloc/menu_bloc.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/information_toast/information_toast_ui.dart';
import 'package:mik_tilt_maze/features/menu/presentation/widgets/stars_counter/stars_counter_ui.dart';
import 'package:mik_tilt_maze/shared/extensions/context_theme_extension.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/buttons/base_icon_button.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/dialogs/base_modal_bottom_sheet.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/icons/base_icon.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/nav/base_top_navigation_bar.dart';
import 'package:mik_tilt_maze/shared/presentation/ui/text/base_text.dart';

class GamePage extends StatefulWidget {
  final String levelId;

  const GamePage({super.key, required this.levelId});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  MazeGame? _game;

  void _handleTargetCollected(GridPos pos) {
    context.read<GameBloc>().add(const GameEvent.addStar());
  }

  void _handleGoalReached() {
    final gameState = context.read<GameBloc>().state;
    context.read<MenuBloc>().add(
      MenuEvent.saveCurrentLevelProgress(
        gameState.currentLevel!.id,
        gameState.stars,
      ),
    );
    context.goNamed(
      'score',
      extra: {'stars': gameState.stars, 'level_id': gameState.currentLevel?.id},
    );
  }

  void _handleBackHome() {
    context.goNamed('home');
  }

  void _restartGame() {
    final level = context.read<GameBloc>().state.currentLevel;
    if (level != null) {
      setState(() {
        _game = MazeGame(
          level: level,
          onTargetCollected: _handleTargetCollected,
          onGoalReached: _handleGoalReached,
        );
      });
    }
    context.read<GameBloc>().add(const GameEvent.restartGame());
  }

  void _handleRestartGame() {
    _restartGame();
    context.pop();
  }

  void _handleResume() {
    context.pop();
  }

  void _handleGoToLevels() {
    context.goNamed('campaign', queryParameters: {'from_game': 'true'});
  }

  String _formatSeconds(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Future<void> _handleGamePause() async {
    final gameBloc = context.read<GameBloc>();
    gameBloc.add(const GameEvent.pauseTimer());
    final result = await showBaseModalBottomSheet(
      context: context,
      child: Column(
        children: [
          BaseText(
            '${gameBloc.state.currentLevel?.id}',
            color: context.colors.textPrimary.withValues(alpha: 0.8),
          ),
          Gap(context.spacing.xxxs),
          const BaseText('Paused', type: BaseTextType.large),
          Gap(context.spacing.md),
          BaseButton(
            icon: BaseIconName.play,
            text: 'Resume',
            withoutIconContainer: true,
            isHighlighted: true,
            textCenter: true,
            onPressed: () {
              gameBloc.add(const GameEvent.resumeTimer());
              _handleResume();
            },
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
                  onPressed: _handleRestartGame,
                ),
              ),
              Expanded(
                child: BaseButton(
                  icon: BaseIconName.compass,
                  text: 'Go to levels',
                  withoutIconContainer: true,
                  textCenter: true,
                  onPressed: _handleGoToLevels,
                ),
              ),
            ],
          ),
          Gap(context.spacing.sm),
          BaseButton(
            icon: BaseIconName.home,
            text: 'Back home',
            withoutIconContainer: true,
            textCenter: true,
            onPressed: _handleBackHome,
          ),
        ],
      ),
    );

    if (result == null && !gameBloc.isClosed) {
      gameBloc.add(const GameEvent.resumeTimer());
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<GameBloc>().add(GameEvent.loadLevel(widget.levelId));
    context.read<GameBloc>().add(const GameEvent.startTimer());
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      BlocListener<GameBloc, GameState>(
        listenWhen: (previous, current) =>
            previous.currentLevel != current.currentLevel,
        listener: (context, gameState) {
          if (gameState.currentLevel != null && _game == null) {
            setState(() {
              _game = MazeGame(
                level: gameState.currentLevel!,
                onTargetCollected: _handleTargetCollected,
                onGoalReached: _handleGoalReached,
              );
            });
          }
        },
      ),
      BlocListener<GameBloc, GameState>(
        listenWhen: (previous, current) =>
            previous.timerStatus != current.timerStatus,
        listener: (context, gameState) {
          if (gameState.timerStatus == GameTimerStatus.finished) {
            _restartGame();
          }
        },
      ),
    ],
    child: Scaffold(
      appBar: BaseTopNavigationBar(
        children: [
          BaseIconButton(icon: BaseIconName.pause, onPressed: _handleGamePause),
          const Spacer(),
          BlocBuilder<GameBloc, GameState>(
            builder: (context, gameState) => Row(
              children: [
                InformationToastUi(
                  value: _formatSeconds(gameState.secondsLeft),
                  icon: BaseIconName.time,
                ),
                Gap(context.spacing.md),
                StarsCounterUi(value: '${gameState.stars} / 3'),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: context.colors.surface0,
      body: SafeArea(
        child: _game == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
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
                      width: MediaQuery.of(context).size.width - 48,
                      height: MediaQuery.of(context).size.width - 48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(context.spacing.md),
                        child: GameWidget(game: _game!),
                      ),
                    ),
                    const Spacer(),
                    const InformationToastUi(
                      value: 'Tilt your phone to move',
                      icon: BaseIconName.mobile,
                    ),
                  ],
                ),
              ),
      ),
    ),
  );
}
