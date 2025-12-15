import 'package:flutter/material.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class InputButto extends StatefulWidget {
  const InputButto({super.key});

  @override
  State<InputButto> createState() => _InputButtoState();
}

class _InputButtoState extends State<InputButto> {
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
      children: [
        TextField(
          controller: _focusController,
          keyboardType: TextInputType.number,
        )
      ],
    );
  }
}