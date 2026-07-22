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

import '../../features/game/application/commands/example/example_command_handler.dart'
    as _i382;
import '../../features/game/bloc/game_bloc.dart' as _i306;
import '../../features/menu/bloc/menu_bloc.dart' as _i504;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i382.ExampleCommandHandler>(
      () => _i382.ExampleCommandHandler(),
    );
    gh.factory<_i306.GameBloc>(() => _i306.GameBloc());
    gh.lazySingleton<_i504.MenuBloc>(() => _i504.MenuBloc());
    return this;
  }
}
