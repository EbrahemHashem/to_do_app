// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/cubits/display_to_do_cubit/display_to_do_stats_cubit.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/widgets/custom_audioplayer.dart';

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
        dismissible: DismissiblePane(onDismissed: () {
          widget.toDoModel.delete();
          BlocProvider.of<DisplayToDoStatsCubit>(context).fetchAlltodo();
          deleteSound();
        }),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            backgroundColor: const Color.fromARGB(255, 244, 73, 54),
            borderRadius: BorderRadius.circular(12),
            // delete
            onPressed: (context) {
              widget.toDoModel.delete();
              BlocProvider.of<DisplayToDoStatsCubit>(context).fetchAlltodo();
              deleteSound();
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
                checkColor: Colors.red,
                value: widget.toDoModel.isDone,
                activeColor: Colors.black87,
                onChanged: (bool? value) {
                  widget.toDoModel.isDone = value!;
                  widget.toDoModel.save();
                  BlocProvider.of<DisplayToDoStatsCubit>(context).fetchAlltodo();
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
