import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mik_tilt_maze/core/di/container_config.dart';

class Bootstrap {
  Future<void> init() async {
    await _setupDevice();
    await _setupDependencies();
  }

  Future<void> _setupDevice() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> _setupDependencies() async {
    await configureDependencies();
  }
}
