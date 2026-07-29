import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/features/game/application/commands/generate_random_level/generate_random_level_command.dart';
import 'package:mik_tilt_maze/features/game/application/commands/generate_random_level/generate_random_level_command_handler.dart';
import 'package:mik_tilt_maze/features/game/application/commands/load_level/load_level_command.dart';
import 'package:mik_tilt_maze/features/game/application/commands/load_level/load_level_command_handler.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  final LoadLevelCommandHandler _loadLevelCommandHandler;
  final GenerateRandomLevelCommandHandler _generateRandomLevelCommandHandler;

  static const int timerDuration = 30;

  Timer? _timer;

  GameBloc(this._loadLevelCommandHandler, this._generateRandomLevelCommandHandler)
    : super(GameState.initial()) {
    on<_LoadLevel>(_onLoadLevel);
    on<_LoadRandomLevel>(_onLoadRandomLevel);
    on<_AddStar>(_onAddStar);
    on<_StartTimer>(_onStartTimer);
    on<_PauseTimer>(_onPauseTimer);
    on<_ResumeTimer>(_onResumeTimer);
    on<_ResetTimer>(_onResetTimer);
    on<_TimerTicked>(_onTimerTicked);
    on<_RestartGame>(_onRestartGame);
  }

  Future<void> _onLoadLevel(_LoadLevel event, Emitter<GameState> emit) async {
    try {
      final level = await _loadLevelCommandHandler.handle(
        LoadLevelCommand(levelName: event.levelName),
      );
      emit(state.copyWith(currentLevel: level));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onLoadRandomLevel(
    _LoadRandomLevel event,
    Emitter<GameState> emit,
  ) async {
    try {
      final level = await _generateRandomLevelCommandHandler.handle(
        GenerateRandomLevelCommand(),
      );
      emit(state.copyWith(currentLevel: level));
    } catch (e) {
      print(e);
    }
  }

  void _onAddStar(_AddStar event, Emitter<GameState> emit) {
    emit(state.copyWith(stars: state.stars + 1));
  }

  void _onStartTimer(_StartTimer event, Emitter<GameState> emit) {
    _startTicker();
    emit(
      state.copyWith(
        secondsLeft: timerDuration,
        timerStatus: GameTimerStatus.running,
      ),
    );
  }

  void _onPauseTimer(_PauseTimer event, Emitter<GameState> emit) {
    if (state.timerStatus != GameTimerStatus.running) return;
    _timer?.cancel();
    emit(state.copyWith(timerStatus: GameTimerStatus.paused));
  }

  void _onResumeTimer(_ResumeTimer event, Emitter<GameState> emit) {
    if (state.timerStatus != GameTimerStatus.paused) return;
    _startTicker();
    emit(state.copyWith(timerStatus: GameTimerStatus.running));
  }

  void _onResetTimer(_ResetTimer event, Emitter<GameState> emit) {
    _timer?.cancel();
    emit(
      state.copyWith(
        secondsLeft: timerDuration,
        timerStatus: GameTimerStatus.initial,
      ),
    );
  }

  void _onTimerTicked(_TimerTicked event, Emitter<GameState> emit) {
    if (event.secondsLeft <= 0) {
      _timer?.cancel();
      emit(
        state.copyWith(secondsLeft: 0, timerStatus: GameTimerStatus.finished),
      );
    } else {
      emit(state.copyWith(secondsLeft: event.secondsLeft));
    }
  }

  void _startTicker() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(GameEvent.timerTicked(state.secondsLeft - 1));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void _onRestartGame(_RestartGame event, Emitter<GameState> emit) {
    _startTicker();
    emit(
      state.copyWith(
        stars: 0,
        secondsLeft: timerDuration,
        timerStatus: GameTimerStatus.running,
      ),
    );
  }
}
