part of 'game_bloc.dart';

@freezed
sealed class GameEvent with _$GameEvent {
  const factory GameEvent.something() = _Something;
}
