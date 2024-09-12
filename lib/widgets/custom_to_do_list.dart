// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomToDoList extends StatelessWidget {
  CustomToDoList({
    super.key,
    required this.name,
    required this.value,
    required this.onChanged,
  });
  final String name;
  final bool value;
  void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.yellow,
        ),
        child: Row(children: [
          Checkbox(value: value, onChanged: onChanged),
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
