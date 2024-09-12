import 'package:flutter/material.dart';
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
          return const CustomDialog();
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
