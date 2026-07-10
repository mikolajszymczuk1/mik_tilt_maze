import 'package:mik_tilt_maze/core/cqrs/command.dart';
import 'package:mik_tilt_maze/core/cqrs/query.dart';

abstract class CommandHandler<TCommand extends Command<TResult>, TResult> {
  Future<TResult> handle(TCommand command);
}

abstract class QueryHandler<TQuery extends Query<TResult>, TResult> {
  Future<TResult> handle(TQuery query);
}
