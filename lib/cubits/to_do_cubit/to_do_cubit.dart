import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_state.dart';
import 'package:to_do_app/models/to_do_model.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoIntialState());

  addToDo(ToDoModel toDo) async {
    emit(ToDoLoadingState());

    try {
      var toDoBox = Hive.box<ToDoModel>(kToDoBox);
      emit(ToDoSuccessState());
      await toDoBox.add(toDo);
    } catch (e) {
      ToDoFailureState(e.toString());
    }
  }
}
