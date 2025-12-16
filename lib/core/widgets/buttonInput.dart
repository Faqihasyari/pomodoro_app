import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class InputButton extends StatefulWidget {
  const InputButton({super.key});

  @override
  State<InputButton> createState() => _InputButtonState();
}

class _InputButtonState extends State<InputButton> {
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
    return Row(
      spacing: 20,
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
        //  SizedBox(
        //   width: 100,
        //   height: 50,
        //    child: TextField(
            
        //     controller: _restController,
        //     keyboardType: TextInputType.number,
        //     decoration: InputDecoration(
        //       hintText: 'Waktu Istirahat'
        //     ),
        //            ),
        //  )
        Column(
          children: [
            Text('Waktu (min)', style: fontBtnTimer,),
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
    );
  }
}