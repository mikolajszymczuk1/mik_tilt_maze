// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/game/application/commands/load_level/load_level_command_handler.dart'
    as _i273;
import '../../features/game/bloc/game_bloc.dart' as _i306;
import '../../features/menu/application/commands/save_current_level_progress/save_current_level_progress_command_handler.dart'
    as _i620;
import '../../features/menu/application/queries/load_levels_metadata/load_levels_metadata_query_handler.dart'
    as _i513;
import '../../features/menu/application/queries/load_levels_progress/load_levels_progress_query_handler.dart'
    as _i976;
import '../../features/menu/bloc/menu_bloc.dart' as _i504;
import '../../shared/infrastructure/database/database.dart' as _i264;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i273.LoadLevelCommandHandler>(
      () => _i273.LoadLevelCommandHandler(),
    );
    gh.factory<_i513.LoadLevelsMetadataQueryHandler>(
      () => _i513.LoadLevelsMetadataQueryHandler(),
    );
    gh.singleton<_i264.AppDatabase>(() => _i264.AppDatabase());
    gh.factory<_i620.SaveCurrentLevelProgressCommandHandler>(
      () =>
          _i620.SaveCurrentLevelProgressCommandHandler(gh<_i264.AppDatabase>()),
    );
    gh.factory<_i976.LoadLevelsProgressQueryHandler>(
      () => _i976.LoadLevelsProgressQueryHandler(gh<_i264.AppDatabase>()),
    );
    gh.factory<_i306.GameBloc>(
      () => _i306.GameBloc(gh<_i273.LoadLevelCommandHandler>()),
    );
    gh.lazySingleton<_i504.MenuBloc>(
      () => _i504.MenuBloc(
        gh<_i976.LoadLevelsProgressQueryHandler>(),
        gh<_i513.LoadLevelsMetadataQueryHandler>(),
        gh<_i620.SaveCurrentLevelProgressCommandHandler>(),
      ),
    );
    return this;
  }
}
