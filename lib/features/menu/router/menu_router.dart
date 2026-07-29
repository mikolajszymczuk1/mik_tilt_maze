import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/presentation/pages/campaign_page.dart';
import 'package:mik_tilt_maze/features/menu/presentation/pages/home_page.dart';
import 'package:mik_tilt_maze/features/menu/presentation/pages/score_page.dart';

List<GoRoute> menuRoutes = [
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/campaign',
    name: 'campaign',
    builder: (context, state) {
      final fromGame = state.uri.queryParameters['from_game'] == 'true';
      return CampaignPage(fromGame: fromGame);
    },
  ),
  GoRoute(
    path: '/score',
    name: 'score',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final stars = extra?['stars'] as int? ?? 0;
      final levelId = extra?['level_id'] as String;
      final isQuickPlay = extra?['is_quick_play'] as bool? ?? false;
      return ScorePage(stars: stars, levelId: levelId, isQuickPlay: isQuickPlay);
    },
  ),
];
