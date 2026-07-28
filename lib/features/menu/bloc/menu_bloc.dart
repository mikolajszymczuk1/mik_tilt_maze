import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/features/menu/application/commands/save_current_level_progress/save_current_level_progress_command.dart';
import 'package:mik_tilt_maze/features/menu/application/commands/save_current_level_progress/save_current_level_progress_command_handler.dart';
import 'package:mik_tilt_maze/features/menu/application/queries/load_levels_metadata/load_levels_metadata_query.dart';
import 'package:mik_tilt_maze/features/menu/application/queries/load_levels_metadata/load_levels_metadata_query_handler.dart';
import 'package:mik_tilt_maze/features/menu/application/queries/load_levels_progress/load_levels_progress_query.dart';
import 'package:mik_tilt_maze/features/menu/application/queries/load_levels_progress/load_levels_progress_query_handler.dart';
import 'package:mik_tilt_maze/features/menu/domain/models/level_progress.dart';

part 'menu_bloc.freezed.dart';
part 'menu_event.dart';
part 'menu_state.dart';

@lazySingleton
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final LoadLevelsProgressQueryHandler _loadLevelsProgressQueryHandler;
  final LoadLevelsMetadataQueryHandler _loadLevelsMetadataQueryHandler;

  final SaveCurrentLevelProgressCommandHandler
  _saveCurrentLevelProgressCommandHandler;

  MenuBloc(
    this._loadLevelsProgressQueryHandler,
    this._loadLevelsMetadataQueryHandler,
    this._saveCurrentLevelProgressCommandHandler,
  ) : super(MenuState.initial()) {
    on<_LoadLevelsProgress>(_onLoadLevelsProgress);
    on<_LoadLevelsMetadata>(_onLoadLevelsMetadata);
    on<_SaveCurrentLevelProgress>(_onSaveCurrentLevelProgress);
  }

  Future<void> _onLoadLevelsProgress(
    _LoadLevelsProgress event,
    Emitter<MenuState> emit,
  ) async {
    final progress = await _loadLevelsProgressQueryHandler.handle(
      LoadLevelsProgressQuery(),
    );
    emit(state.copyWith(progress: progress));
  }

  Future<void> _onLoadLevelsMetadata(
    _LoadLevelsMetadata event,
    Emitter<MenuState> emit,
  ) async {
    final levelIds = await _loadLevelsMetadataQueryHandler.handle(
      LoadLevelsMetadataQuery(),
    );

    emit(state.copyWith(loadedLevelsIds: levelIds));
  }

  Future<void> _onSaveCurrentLevelProgress(
    _SaveCurrentLevelProgress event,
    Emitter<MenuState> emit,
  ) async {
    final updatedProgress = await _saveCurrentLevelProgressCommandHandler
        .handle(
          SaveCurrentLevelProgressCommand(
            progress: state.progress,
            levelId: event.levelId,
            stars: event.stars,
          ),
        );

    emit(state.copyWith(progress: updatedProgress));
  }
}
