import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/cqrs/handler.dart';
import 'package:mik_tilt_maze/features/game/application/commands/load_level/load_level_command.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';

@injectable
class LoadLevelCommandHandler
    implements CommandHandler<LoadLevelCommand, MazeLevel> {
  @override
  Future<MazeLevel> handle(LoadLevelCommand command) async {
    final jsonString = await rootBundle.loadString(
      'lib/features/game/levels_data/${command.levelName}.json',
    );
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    final level = MazeLevel.fromJson(jsonData);

    return level;
  }
}
