import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_floating_action_button.dart';
import 'package:to_do_app/widgets/custom_to_do_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        floatingActionButton: const CustomFloatingActionButton(),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return CustomToDoList(
              name: 'name',
              value: false,
              onChanged: (p0) {},
            );
          },
        ));
  }
}
