part of 'display_to_do_stats_cubit.dart';

abstract class DisplayToDoStatsState {}

final class DisplayToDoStatsInitial extends DisplayToDoStatsState {}

final class DisplayToDoStatsLoadig extends DisplayToDoStatsState {}

final class DisplayToDoStatsSuccess extends DisplayToDoStatsState {
  final List<ToDoModel> todos;

  DisplayToDoStatsSuccess(this.todos);
}

final class DisplayToDoStatsFailure extends DisplayToDoStatsState {
  final String errMessage;
  DisplayToDoStatsFailure(this.errMessage);
}
