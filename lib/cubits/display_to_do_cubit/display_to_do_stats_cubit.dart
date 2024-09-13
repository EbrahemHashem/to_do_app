import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/to_do_model.dart';

part 'display_to_do_stats_state.dart';

class DisplayToDoStatsCubit extends Cubit<DisplayToDoStatsState> {
  DisplayToDoStatsCubit() : super(DisplayToDoStatsInitial());
  List<ToDoModel>? todos;

  fetchAlltodo() {
    var toDoBox = Hive.box<ToDoModel>(kToDoBox);
    todos = toDoBox.values.toList();
    emit(DisplayToDoStatssuccess());
  }
}
