import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Todo App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}
