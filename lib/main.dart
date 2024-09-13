import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/cubits/display_to_do_cubit/display_to_do_stats_cubit.dart';
import 'package:to_do_app/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() async {
  // hive
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>(kToDoBox);
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToDoCubit(),
        ),
        BlocProvider(
          create: (context) => DisplayToDoStatsCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(32, 21, 95, .8),
            centerTitle: true,
            title: const Text(
              "Todo App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: const HomePage(),
        ),
      ),
    );
  }
}
