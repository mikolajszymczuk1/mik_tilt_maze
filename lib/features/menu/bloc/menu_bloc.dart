import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'menu_bloc.freezed.dart';
part 'menu_event.dart';
part 'menu_state.dart';

const _levelsAssetPath = 'lib/features/game/levels_data/';

@lazySingleton
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState.initial()) {
    on<_LoadLevelsProgress>(_onLoadLevelsProgress);
    on<_LoadLevelsMetadata>(_onLoadLevelsMetadata);
  }

  void _onLoadLevelsProgress(
    _LoadLevelsProgress event,
    Emitter<MenuState> emit,
  ) {}

  Future<void> _onLoadLevelsMetadata(
    _LoadLevelsMetadata event,
    Emitter<MenuState> emit,
  ) async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final levelIds =
        manifest
            .listAssets()
            .where(
              (path) =>
                  path.startsWith(_levelsAssetPath) && path.endsWith('.json'),
            )
            .map((path) => path.split('/').last.replaceAll('.json', ''))
            .toList()
          ..sort(
            (a, b) => int.parse(
              a.replaceFirst('level_', ''),
            ).compareTo(int.parse(b.replaceFirst('level_', ''))),
          );

    emit(state.copyWith(loadedLevelsIds: levelIds));
  }
}
