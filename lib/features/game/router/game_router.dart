import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/core/di/container_config.dart';
import 'package:mik_tilt_maze/features/game/bloc/game_bloc.dart';
import 'package:mik_tilt_maze/features/game/presentation/pages/game_page.dart';

List<GoRoute> gameRoutes = [
  GoRoute(
    path: '/game/:level_id',
    name: 'game',
    builder: (context, state) {
      final String levelId = state.pathParameters['level_id']!;
      return BlocProvider(
        create: (_) => getIt<GameBloc>(),
        child: GamePage(levelId: levelId),
      );
    },
  ),
];
