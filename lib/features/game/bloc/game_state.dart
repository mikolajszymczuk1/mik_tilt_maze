part of 'game_bloc.dart';

enum GameTimerStatus { initial, running, paused, finished }

@freezed
sealed class GameState with _$GameState {
  const GameState._();

  const factory GameState({
    MazeLevel? currentLevel,
    @Default(0) int stars,
    @Default(GameBloc.timerDuration) int secondsLeft,
    @Default(GameTimerStatus.initial) GameTimerStatus timerStatus,
  }) = _GameState;

  factory GameState.initial() => const GameState();
}
