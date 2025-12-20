import 'package:flutter/widgets.dart';
import 'package:pomodoro_app/core/constants/color.dart';

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
      decoration: BoxDecoration(
        color: bgContainerTrigger,
        borderRadius: BorderRadius.circular(2),
        
      ),
      // child: ,
    );
  }
}