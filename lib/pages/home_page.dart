import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/display_to_do_cubit/display_to_do_stats_cubit.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/widgets/custom_floating_action_button.dart';
import 'package:to_do_app/widgets/custom_to_do_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // initial state
  @override
  void initState() {
    BlocProvider.of<DisplayToDoStatsCubit>(context).fetchAlltodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayToDoStatsCubit, DisplayToDoStatsState>(
      builder: (context, state) {
        List<ToDoModel> todos = BlocProvider.of<DisplayToDoStatsCubit>(context).todos ?? [];
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          backgroundColor: const Color(0xff663ebc),
          floatingActionButton: const CustomFloatingActionButton(),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return CustomToDoList(
                toDoModel: todos[index],
              );
            },
          ),
        );
      },
    );
  }
}
