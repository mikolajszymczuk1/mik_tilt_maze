part of 'game_bloc.dart';

@freezed
sealed class GameEvent with _$GameEvent {
  const factory GameEvent.something() = _Something;

  const factory GameEvent.loadLevel(String mode, String levelName) = _LoadLevel;
}
