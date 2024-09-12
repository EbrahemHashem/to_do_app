import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_app/widgets/custom_floating_action_button.dart';
import 'package:to_do_app/widgets/custom_to_do_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToDoCubit(),
        )
      ],
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        floatingActionButton: const CustomFloatingActionButton(),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return CustomToDoList(
              name: 'name',
              value: true,
              onChanged: (p0) {},
            );
          },
        ),
      ),
    );
  }
}
