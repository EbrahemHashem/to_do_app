// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/models/to_do_model.dart';

class CustomToDoList extends StatefulWidget {
  const CustomToDoList({super.key, required this.toDoModel});
  final ToDoModel toDoModel;

  @override
  State<CustomToDoList> createState() => _CustomToDoListState();
}

class _CustomToDoListState extends State<CustomToDoList> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      // slidable

      key: const ValueKey(ToDoModel),
      closeOnScroll: true,
      endActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: () {}),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            onPressed: (context) {
              widget.toDoModel.delete();
            },
            icon: Icons.delete,
          )
        ],
      ),
      // end slidable
      child: Padding(
          padding: const EdgeInsets.all(18),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.yellow,
            ),
            child: Row(children: [
              // check box
              Checkbox(
                value: widget.toDoModel.isDone,
                activeColor: Colors.black87,
                onChanged: (bool? value) {
                  widget.toDoModel.isDone = value!;
                  setState(() {});
                },
              ),
              // title
              Text(
                widget.toDoModel.title,
                style: TextStyle(
                  fontSize: 18,
                  decoration: widget.toDoModel.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ]),
          )),
    );
  }
}
