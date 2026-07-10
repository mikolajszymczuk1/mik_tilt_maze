import 'package:mik_tilt_maze/core/cqrs/command.dart';

class ExampleCommand extends Command<void> {
  final String text;

  ExampleCommand({required this.text});
}
