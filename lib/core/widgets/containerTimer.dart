import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/core/models/containerItem.dart';
import 'package:pomodoro_app/core/models/containerModel.dart';
import 'package:pomodoro_app/core/models/dotLine.dart';
import 'package:pomodoro_app/core/models/notification.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class Containertimer extends StatefulWidget {
  const Containertimer({super.key});

  @override
  State<Containertimer> createState() => _ContainertimerState();

  
}

class _ContainertimerState extends State<Containertimer> {
      final _focusController = TextEditingController();
  final _restController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // responsive declare
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // container model
    final animasiRunning = Containermodel(
  lottieAsset: 'assets/lottie/loading.json',
);

final animasiStop = Containermodel(
  icon: Icons.access_time,
);

    // catch pomodoro provider
          final pomodoro = context.watch<PomodoroProvider>();
     String formatTime(int seconds) {
      final m = (seconds ~/ 60).toString().padLeft(2, '0');
      final s = (seconds % 60).toString().padLeft(2, '0');
      return '$m:$s';
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 1020,
      width: 500,
      decoration: BoxDecoration(
        color: timerContainer,
        border: Border.all(color: Colors.black,width: 4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          offset: Offset(6, 6),
          color: Colors.black
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Puuuuuuqi Pomodoro', style: fontHeaderTimer,),
          SizedBox(height: 20,),
          Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: 5,
          children: [
            Text('Waktu (min)', style: fontBtnTimer,),
            SizedBox(
              width: screenWidth * 0.3,
              height: screenWidth * 0.1,
              child: TextField(
                maxLines: null,
                style: fontBtnTimer,
                expands: true,
                      controller: _focusController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: outlineBorder,
                    width: 3,
                  ),
                ),
              
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: outlineBorder,
                    width: 3,
                  ),
                ),
                      ),),
                      
            ),
          ],
        ),
        Column(
          spacing: 5,
          children: [
            Text('Istirahat (min)', style: fontBtnTimer,),
            SizedBox(
              width: screenWidth * 0.3,
              height: screenWidth * 0.1,
              child: TextField(
                style: fontBtnTimer,
                maxLines: null,
                
                expands: true,
                      controller: _restController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: outlineBorder,
                    width: 3,
                  ),
                ),
              
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: outlineBorder,
                    width: 3,
                  ),
                ),
                      ),),
                      
            ),
          ],
        ),
      ],
    ),
    DottedLine(
      height: 4,
      color: Colors.black,
    ),
    if(pomodoro.isRunning)
    Containeritem(lottie: animasiRunning,)
      else 
      Containeritem(icon: animasiStop,),
      DottedLine(
        color: Colors.black,
        height: 4,
      ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: bgContainer,
                border: Border.all(width: 3, color: outlineBorder),
                borderRadius: BorderRadius.circular(20)
              ),
              
              child: Center(child: Text(formatTime(pomodoro.remainingTime), style: fontTimer,))),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                final focus = int.tryParse(_focusController.text) ?? 25;
                      final rest = int.tryParse(_restController.text) ?? 5;
                      context.read<PomodoroProvider>().initialize(focus, rest);
              },
              child: Container(
                
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  color: btnContainer,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.black),
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5)
                  )]
                ),
                child: Center(child: Text('SET TIMER', style: btnSetTimer,)),
              ),
            ),
            SizedBox(height: 20,)
          ,Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
              onTap: () {
                final currentFocus = int.tryParse(_focusController.text) ?? 25;
                final currentRest = int.tryParse(_restController.text) ?? 5;

                if (!pomodoro.isInitializated || currentFocus != pomodoro.activeFocusMinutes || currentRest != pomodoro.activeRestMinutes) {
                  showCenteredNotification(context, 'Tekan SET TIMER dulu blog',);
                  return;
                } else {
                  pomodoro.isRunning ? pomodoro.pause() : pomodoro.start();
                }
              },
              
              child: Container(
                
                width: 195,
                height: 70,
                decoration: BoxDecoration(
                  color: startBtn,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.black),
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5)
                  )]
                ),
                child: Center(child: Text(pomodoro.isRunning ? 'PAUSE' :'START', style: btnSetTimer,)),
              ),
                          ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: () {
                if (!context.read<PomodoroProvider>().isInitializated) {
                  showCenteredNotification(context, 'Timernya di start dulu kocak');
                  return;
                }
                context.read<PomodoroProvider>().reset();
              },
              child: Container(
                
                width: 195,
                height: 70,
                decoration: BoxDecoration(
                  color: resetBtn,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.black),
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5)
                  )]
                ),
                child: Center(child: Text('RESET', style: btnSetTimer,)),
              ),
            ),
              
            ],
          ),
          DottedLine(
        color: Colors.black,
        height: 4,
      ),
          Text('Total Fokus ${pomodoro.totalFocusMinutes} min', style: fontBtnTimer,)
        ],
      ),
    );
  }
}