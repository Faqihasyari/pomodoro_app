import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodoro_app/core/models/task.dart';
import 'package:uuid/uuid.dart'; 

class TaskProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];
  final Box<TaskModel> _taskBox;

  TaskProvider({required Box<TaskModel> taskBox}) : _taskBox = taskBox;


  List<TaskModel> get tasks => _tasks;

  void addTask(String task) {
    if (task.trim().isEmpty) return; 

    final newTask = TaskModel(
      id: const Uuid().v4(), 
      task: task.trim(),
    );

    _tasks.add(newTask);
    notifyListeners(); 
  }

  void toggleTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex] = _tasks[taskIndex].copyWith(
        isCompleted: !_tasks[taskIndex].isCompleted,
      );
      notifyListeners();
    }
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }
}