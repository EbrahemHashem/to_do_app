import 'package:bloc/bloc.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoAddState());
}
