import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/models/dotLine.dart';
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

        final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('APLIKASI POMODORO', style: GoogleFonts.audiowide(fontSize: 28),),
                  DottedLine(
                  color: Colors.white,
                  height: 4,
                ),
                SizedBox(
                  width: screenWidth * 0.8,
      height: screenHeight * 0.4,
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                  
                      CuteTodoPage(),
                                        Bullet(),
                    ],
                  ),
                ),
                DottedLine(
                  color: Colors.white,
                  height: 4,
                ),
                // input timer pomodoro
                Containertimer(),
                DottedLine(
                  color: Colors.white,
                  height: 4,
                ),
                Triggerwidgets(),
                DottedLine(
                  color: Colors.white,
                  height: 4,
                ),
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}


