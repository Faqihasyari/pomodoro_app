import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/widgets/bullet.dart';
import 'package:pomodoro_app/core/widgets/todo_list.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _focusController = TextEditingController();
  final _testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pomodoro = context.watch<PomodoroProvider>();
    
    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text('jaksdjasndansdajdjansjandasndaalsndlnsdasnajsndn'),
                    ],
                  )),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Stack(
                          children: [

                            CuteTodoPage(),
                      Bullet(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // timer pomodoro
          ],
        ),
      ),
    );
  }
}
