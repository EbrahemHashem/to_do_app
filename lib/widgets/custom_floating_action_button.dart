import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_state.dart';
import 'package:to_do_app/widgets/custom_dialog.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    //
    void createNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return BlocListener<ToDoCubit, ToDoState>(
            listener: (context, state) {
              // success state
              if (state is ToDoSuccessState) {
                debugPrint('succcesss');
                Navigator.of(context).pop();
              }
              // failure state
              if (state is ToDoFailureState) {
                debugPrint('failed ${state.errMessage}');
              }
            },
            child: const CustomDialog(),
          );
        },
      );
    }

    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.orange,
      onPressed: createNewTask,
      child: const Icon(
        Icons.add,
        size: 36,
      ),
    );
  }
}
