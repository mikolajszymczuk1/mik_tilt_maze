import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/di/container_config.dart';
import 'package:mik_tilt_maze/features/game/application/commands/example/example_command.dart';
import 'package:mik_tilt_maze/features/game/application/commands/example/example_command_handler.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<_Something>(_onSomething);
  }

  Future<void> _onSomething(_Something event, Emitter<GameState> emit) async {
    await getIt<ExampleCommandHandler>().handle(
      ExampleCommand(text: 'Hello World!'),
    );
  }
}
