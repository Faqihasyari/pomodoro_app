import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';
import 'package:pomodoro_app/core/models/dotLine.dart';

class Triggerwidgets extends StatefulWidget {
  const Triggerwidgets({super.key});

  @override
  State<Triggerwidgets> createState() => _TriggerwidgetsState();
}

class _TriggerwidgetsState extends State<Triggerwidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgContainerTrigger.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ke trigger kenapa banh?', style: frindly,),
          DottedLineTriggers(color: Colors.black, height: 3,)
        ],
      ),
    );
  }
}