import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mik_tilt_maze/core/di/container_config.dart';
import 'package:mik_tilt_maze/core/router/app_router.dart';
import 'package:mik_tilt_maze/features/menu/bloc/menu_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [BlocProvider.value(value: getIt<MenuBloc>())],
    child: MaterialApp.router(
      title: 'Mik Tilt Maze',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    ),
  );
}
