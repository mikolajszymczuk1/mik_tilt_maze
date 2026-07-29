import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/cqrs/handler.dart';
import 'package:mik_tilt_maze/features/game/application/commands/generate_random_level/generate_random_level_command.dart';
import 'package:mik_tilt_maze/features/game/domain/models/maze_level.dart';
import 'package:mik_tilt_maze/features/game/infrastructure/services/maze_generator_service.dart';

@injectable
class GenerateRandomLevelCommandHandler
    implements CommandHandler<GenerateRandomLevelCommand, MazeLevel> {
  final MazeGeneratorService _mazeGeneratorService = MazeGeneratorService();

  @override
  Future<MazeLevel> handle(GenerateRandomLevelCommand command) async =>
      _mazeGeneratorService.generate(rows: command.rows, cols: command.cols);
}
