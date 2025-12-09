import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/widgets/todo_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: CuteTodoPage(),
      ),
    );
  }
}