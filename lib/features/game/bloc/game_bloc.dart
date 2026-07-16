import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/di/container_config.dart';
import 'package:mik_tilt_maze/features/game/application/commands/example/example_command.dart';
import 'package:mik_tilt_maze/features/game/application/commands/example/example_command_handler.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<_Something>(_onSomething);
    on<_LoadLevel>(_onLoadLevel);
  }

  Future<void> _onSomething(_Something event, Emitter<GameState> emit) async {
    await getIt<ExampleCommandHandler>().handle(
      ExampleCommand(text: 'Hello World!'),
    );
  }

  Future<void> _onLoadLevel(_LoadLevel event, Emitter<GameState> emit) async {
    try {
      final jsonString = await rootBundle.loadString(
        'lib/features/game/levels_data/${event.mode}/${event.levelName}.json',
      );
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      final level = MazeLevel.fromJson(jsonData);
      emit(state.copyWith(currentLevel: level));
    } catch (e) {
      print(e);
    }
  }
}
