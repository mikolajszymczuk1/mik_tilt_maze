import 'package:injectable/injectable.dart';
import 'package:mik_tilt_maze/core/cqrs/handler.dart';
import 'package:mik_tilt_maze/features/game/application/commands/example/example_command.dart';

@injectable
class ExampleCommandHandler implements CommandHandler<ExampleCommand, void> {
  @override
  Future<void> handle(ExampleCommand command) async {
    print(command.text);
  }
}
