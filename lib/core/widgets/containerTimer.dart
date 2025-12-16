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
        borderRadius: BorderRadius.circular(20)
        
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
            
            
            ElevatedButton(
                    onPressed: () {
                      final focus = int.tryParse(_focusController.text) ?? 25;
                      final rest = int.tryParse(_restController.text) ?? 5;
                      context.read<PomodoroProvider>().initialize(focus, rest);
                    },
                    child: const Text('Set Timer'),
                  ),
          // ,Row(
          //   children: [
          //     ElevatedButton(onPressed: pomodoro.isRunning ? () => context.read<PomodoroProvider>(), child: child)
          //   ],
          // )
        ],
      ),
    );
  }
}