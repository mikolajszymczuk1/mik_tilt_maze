import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mik_tilt_maze/features/game/bloc/game_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameBloc = context.read<GameBloc>();
    gameBloc.add(const GameEvent.something());
    final msg = gameBloc.state.msg;

    return Scaffold(body: SafeArea(child: Text(msg)));
  }
}
