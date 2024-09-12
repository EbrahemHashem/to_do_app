// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({super.key, required this.onCancel, required this.onSave});

  void Function()? onSave;
  void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange[400],
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Add Your Task",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // save button
                CustomButton(
                  onPressed: onSave,
                  text: 'Save',
                ),
                // cancel button
                CustomButton(
                  onPressed: onCancel,
                  text: 'Cancel',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
