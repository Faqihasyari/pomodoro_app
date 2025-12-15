import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/widgets/todo_list.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:pomodoro_app/presentation/screens/home_page.dart';
import 'package:pomodoro_app/presentation/screens/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (context) => TaskProvider()),ChangeNotifierProvider(create: (context) => PomodoroProvider(),)],child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: const MyHomePage(),
    );
  }
}
