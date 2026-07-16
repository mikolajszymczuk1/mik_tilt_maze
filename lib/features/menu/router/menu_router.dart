import 'package:go_router/go_router.dart';
import 'package:mik_tilt_maze/features/menu/presentation/pages/campaign_page.dart';
import 'package:mik_tilt_maze/features/menu/presentation/pages/home_page.dart';

List<GoRoute> menuRoutes = [
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/campaign',
    name: 'campaign',
    builder: (context, state) => const CampaignPage(),
  ),
];
