abstract class ToDoState {}

// intial state
class ToDoIntialState extends ToDoState {}

// loading state
class ToDoLoadingState extends ToDoState {}

// add state
class ToDoAddState extends ToDoState {}

// edit state
class ToDoEditState extends ToDoState {}

// delete state
class ToDoDeleteState extends ToDoState {}

// success state
class ToDoSuccessState extends ToDoState {}

// failure state
class ToDoFailureState extends ToDoState {
  final String errMessage;
  ToDoFailureState(this.errMessage);
}
