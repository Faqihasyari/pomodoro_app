import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/widgets/bullet.dart';
import 'package:pomodoro_app/core/widgets/containerTimer.dart';
import 'package:pomodoro_app/core/widgets/todo_list.dart';
import 'package:pomodoro_app/core/widgets/triggerWidgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                SizedBox(width: 20,),
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                
                    CuteTodoPage(),
                                      Bullet(),
                  ],
                ),
              ),
              // input timer pomodoro
              Containertimer(),
              Triggerwidgets(),

            ],
          ),
        ),
      ),
    );
  }
}


