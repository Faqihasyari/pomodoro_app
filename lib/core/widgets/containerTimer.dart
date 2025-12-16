import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/core/widgets/buttonInput.dart';
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
          final pomodoro = context.watch<PomodoroProvider>();

     String formatTime(int seconds) {
      final m = (seconds ~/ 60).toString().padLeft(2, '0');
      final s = (seconds % 60).toString().padLeft(2, '0');
      return '$m:$s';
    }
    return Container(
      height: 620,
      width: 500,
      decoration: BoxDecoration(
        color: bgContainer,
        border: Border.all(color: Colors.black,width: 4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          offset: Offset(6, 6),
          color: Colors.black
        )]
      ),
      child: Column(
        children: [
          Text('Puuuuuuqi Pomodoro', style: fontHeaderTimer,),
          SizedBox(height: 20,),
          Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('Waktu (min)', style: fontBtnTimer,),
            SizedBox(
              width: 150,
              height: 55,
              child: TextField(
                maxLines: null,
                
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
          children: [
            Text('Istirahat (min)', style: fontBtnTimer,),
            SizedBox(
              width: 150,
              height: 55,
              child: TextField(
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

            Text(formatTime(pomodoro.remainingTime), style: TextStyle(fontSize: 62, fontWeight: FontWeight.bold),),
            
            
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     side: BorderSide(width: 3, color: outlineBorder),
            //     minimumSize: Size(400, 70),
            //     shadowColor: Colors.black,
            //     elevation: 5,
            //     backgroundColor: btnContainer,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15))
                
            //   ),
            //         onPressed: () {
            //           final focus = int.tryParse(_focusController.text) ?? 25;
            //           final rest = int.tryParse(_restController.text) ?? 5;
            //           context.read<PomodoroProvider>().initialize(focus, rest);
            //         },
            //         child:  Text('SET TIMER', style: btnSetTimer,),
                  
            //       ),
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
            )
          ,Row(
            children: [
              ElevatedButton(onPressed: pomodoro.isRunning ? () => context.read<PomodoroProvider>().pause() : ()=> context.read<PomodoroProvider>().start(), child: Text(pomodoro.isRunning ? 'Pause' : 'Start')),
              ElevatedButton(
                  onPressed: () => context.read<PomodoroProvider>().reset(),
                  child: const Text('Reset'),
                ),
            ],
          )
        ],
      ),
    );
  }
}