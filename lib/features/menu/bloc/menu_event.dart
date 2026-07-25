part of 'menu_bloc.dart';

@freezed
sealed class MenuEvent with _$MenuEvent {
  const factory MenuEvent.loadLevelsProgress() = _LoadLevelsProgress;

  const factory MenuEvent.loadLevelsMetadata() = _LoadLevelsMetadata;

  const factory MenuEvent.saveCurrentLevelProgress(String levelId, int stars) =
      _SaveCurrentLevelProgress;
}
