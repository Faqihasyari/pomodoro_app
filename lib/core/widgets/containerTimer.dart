import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/widgets/buttonInput.dart';

class Containertimer extends StatefulWidget {
  const Containertimer({super.key});

  @override
  State<Containertimer> createState() => _ContainertimerState();
}

class _ContainertimerState extends State<Containertimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: bgContainer,
        
      ),
      child: Column(
        children: [
          Text('Puqi Pomodoro'),
          InputButton(),
        ],
      ),
    );
  }
}