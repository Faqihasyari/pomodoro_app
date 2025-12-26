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
    return Container(
      width: screenWidth * 0.8,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
                color: bgContainer,
                border: Border.all(width: 3, color: outlineBorder),
                borderRadius: BorderRadius.circular(20)
              ),
              child: pomodoro.isRunning ? Lottie.asset('assets/lottie/startTimer.json', repeat: true, animate: true, width: 150) : Icon(Icons.access_time, size: 150, color: Colors.black,),
    );
  }
}