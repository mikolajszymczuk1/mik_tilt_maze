part of 'game_bloc.dart';

@freezed
sealed class GameEvent with _$GameEvent {
  const factory GameEvent.something() = _Something;

  const factory GameEvent.loadLevel(String levelName) = _LoadLevel;

  const factory GameEvent.addStar() = _AddStar;

  const factory GameEvent.startTimer() = _StartTimer;

  const factory GameEvent.pauseTimer() = _PauseTimer;

  const factory GameEvent.resumeTimer() = _ResumeTimer;

  const factory GameEvent.resetTimer() = _ResetTimer;

  const factory GameEvent.timerTicked(int secondsLeft) = _TimerTicked;

  const factory GameEvent.restartGame() = _RestartGame;
}
