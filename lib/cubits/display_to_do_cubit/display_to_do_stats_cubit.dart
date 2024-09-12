import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/to_do_model.dart';

part 'display_to_do_stats_state.dart';

class DisplayToDoStatsCubit extends Cubit<DisplayToDoStatsState> {
  DisplayToDoStatsCubit() : super(DisplayToDoStatsInitial());

  fetchAlltodo() async {
    try {
      var toDoBox = Hive.box<ToDoModel>(kToDoBox);

      emit(DisplayToDoStatsSuccess(toDoBox.values.toList()));
    } catch (e) {
      emit(DisplayToDoStatsFailure(e.toString()));
    }
  }
}
