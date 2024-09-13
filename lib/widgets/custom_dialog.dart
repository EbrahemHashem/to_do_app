// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/widgets/custom_button.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;

  void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: AlertDialog(
        backgroundColor: Colors.orange[400],
        content: SizedBox(
          height: 135,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // text field
              TextFormField(
                // validator
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is Empty';
                  }
                  return null;
                },
                // on saved
                onSaved: (value) {
                  title = value;
                },
                decoration: const InputDecoration(
                  hintText: "Add Your Task",
                  border: OutlineInputBorder(),
                ),
              ),
              // row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // save button
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var toDo = ToDoModel(
                          title: title!,
                          id: DateTime.now().toString(),
                        );
                        // provider
                        BlocProvider.of<ToDoCubit>(context).addToDo(toDo);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Save',
                  ),
                  // cancel button
                  CustomButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: 'Cancel',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
