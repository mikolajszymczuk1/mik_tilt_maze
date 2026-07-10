import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mik_tilt_maze/features/game/bloc/game_bloc.dart';
import 'package:mik_tilt_maze/features/game/presentation/game/core/maze_game.dart';

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
    context.read<GameBloc>().add(const GameEvent.loadLevel('example'));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, gameState) {
          final level = gameState.currentLevel;
          if (level == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: SizedBox(
              width: 345,
              height: 345,
              child: GameWidget(game: MazeGame(level: level)),
            ),
          );
        },
      ),
    ),
  );
}
