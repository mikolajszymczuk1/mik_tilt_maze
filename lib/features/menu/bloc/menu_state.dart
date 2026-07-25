part of 'menu_bloc.dart';

extension MenuStateX on MenuState {
  int get totalStars => progress.fold(0, (sum, p) => sum + p.stars);

  int get completedLevelsCount => progress.where((p) => p.stars == 3).length;
}

@freezed
sealed class MenuState with _$MenuState {
  const MenuState._();

  const factory MenuState({
    @Default([]) List<String> loadedLevelsIds,
    @Default([]) List<LevelProgress> progress,
  }) = _MenuState;

  factory MenuState.initial() => const MenuState();
}
