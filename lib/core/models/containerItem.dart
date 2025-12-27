// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/models/containerModel.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class Containeritem extends StatelessWidget {
  final Containermodel? lottie;
  final Containermodel? icon;

  const Containeritem({super.key, this.lottie, this.icon});


  
  @override
  Widget build(BuildContext context) {
    // responsive declare
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final pomodoro = context.watch<PomodoroProvider>();
    
    final isFocusActive = pomodoro.isRunning && pomodoro.isFocusSession;
    
    return
     Container(
      width: screenWidth * 0.8,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
                color: bgContainer,
                border: Border.all(width: 3, color: outlineBorder),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Lottie.asset(
        isFocusActive 
            ? 'assets/lottie/startTimer.json' 
            : 'assets/lottie/restTimer.json',
        repeat: true,
        animate: true,
        width: 150,
      ));
    
  }
}