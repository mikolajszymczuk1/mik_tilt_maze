part of 'game_bloc.dart';

@freezed
sealed class GameState with _$GameState {
  const GameState._();

  const factory GameState({@Default('hello') String msg}) = _GameState;

  factory GameState.initial() => const GameState();
}
