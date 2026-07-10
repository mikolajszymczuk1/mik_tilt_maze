import 'package:flutter/material.dart';
import 'package:mik_tilt_maze/core/app.dart';
import 'package:mik_tilt_maze/core/bootstrap.dart';

Future<void> main() async {
  await Bootstrap().init();
  runApp(const App());
}
