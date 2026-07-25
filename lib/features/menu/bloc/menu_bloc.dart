import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/features/menu/domain/models/level_progress.dart';
import 'package:mik_tilt_maze/shared/infrastructure/database/database.dart';

part 'menu_bloc.freezed.dart';
part 'menu_event.dart';
part 'menu_state.dart';

const _levelsAssetPath = 'lib/features/game/levels_data/';

@lazySingleton
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final AppDatabase _database;

  MenuBloc(this._database) : super(MenuState.initial()) {
    on<_LoadLevelsProgress>(_onLoadLevelsProgress);
    on<_LoadLevelsMetadata>(_onLoadLevelsMetadata);
    on<_SaveCurrentLevelProgress>(_onSaveCurrentLevelProgress);
  }

  Future<void> _onLoadLevelsProgress(
    _LoadLevelsProgress event,
    Emitter<MenuState> emit,
  ) async {
    final rows = await _database.select(_database.levelProgressTable).get();
    final progress = rows
        .map((row) => LevelProgress(levelId: row.id, stars: row.stars))
        .toList();

    emit(state.copyWith(progress: progress));
  }

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

  Future<void> _onSaveCurrentLevelProgress(
    _SaveCurrentLevelProgress event,
    Emitter<MenuState> emit,
  ) async {
    for (final progress in state.progress) {
      if (progress.levelId == event.levelId && event.stars <= progress.stars) {
        return;
      }
    }

    final progressToAdd = LevelProgress(
      levelId: event.levelId,
      stars: event.stars,
    );

    final updatedProgress = [
      ...state.progress.where((progress) => progress.levelId != event.levelId),
      progressToAdd,
    ];

    await _database
        .into(_database.levelProgressTable)
        .insertOnConflictUpdate(
          LevelProgressTableCompanion.insert(
            id: event.levelId,
            stars: Value(event.stars),
          ),
        );

    emit(state.copyWith(progress: updatedProgress));
  }
}
