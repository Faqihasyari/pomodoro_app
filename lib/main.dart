import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodoro_app/core/models/app_data.dart';
import 'package:pomodoro_app/core/models/task.dart';
import 'package:pomodoro_app/core/models/trigger.dart';
import 'package:pomodoro_app/presentation/provider/pomodoro_provider.dart';
import 'package:pomodoro_app/presentation/screens/home_page.dart';
import 'package:pomodoro_app/presentation/screens/provider.dart';
import 'package:pomodoro_app/presentation/screens/trigger_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(AppDataAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TriggerModelAdapter());


  final taskBox = await Hive.openBox<TaskModel>('tasks');
  final triggerBox = await Hive.openBox<TriggerModel>('trigger');

  
  final dataBox = await Hive.openBox<AppData>('app_data');

  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (_) => TaskProvider(taskBox:taskBox)),ChangeNotifierProvider(create: (_) => PomodoroProvider(dataBox:dataBox),), ChangeNotifierProvider(create: (context) => TriggerProvider(triggerBox: triggerBox),) ],child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
