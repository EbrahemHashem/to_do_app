class ToDoModel {
  final String title;
  final bool value;
  void Function(bool?) onChanged;

  ToDoModel({
    required this.title,
    required this.value,
    required this.onChanged,
  });
}
