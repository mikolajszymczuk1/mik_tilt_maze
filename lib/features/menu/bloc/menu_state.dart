part of 'menu_bloc.dart';

@freezed
sealed class MenuState with _$MenuState {
  const MenuState._();

  const factory MenuState() = _MenuState;

  factory MenuState.initial() => const MenuState();
}
