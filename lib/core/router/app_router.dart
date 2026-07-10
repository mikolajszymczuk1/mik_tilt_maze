import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/game/router/game_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/game',
  routes: [...gameRoutes],
);
