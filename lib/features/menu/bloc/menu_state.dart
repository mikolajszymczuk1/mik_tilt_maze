part of 'menu_bloc.dart';

@freezed
sealed class MenuState with _$MenuState {
  const MenuState._();

  const factory MenuState({@Default([]) List<String> loadedLevelsIds}) =
      _MenuState;

  factory MenuState.initial() => const MenuState();
}
