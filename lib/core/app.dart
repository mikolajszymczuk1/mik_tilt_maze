import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Mik Tilt Maze',
    debugShowCheckedModeBanner: false,
    routerConfig: appRouter,
  );
}
