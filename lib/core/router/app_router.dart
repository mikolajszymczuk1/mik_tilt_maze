import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/game/router/game_router.dart';
import 'package:mik_tilt_maze/features/menu/router/menu_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [...menuRoutes, ...gameRoutes],
);
