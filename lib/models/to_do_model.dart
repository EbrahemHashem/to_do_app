import 'package:hive/hive.dart';
part 'to_do_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool value;
  @HiveField(2)
  void Function(bool?) onChanged;

  ToDoModel({
    required this.title,
    required this.value,
    required this.onChanged,
  });
}
