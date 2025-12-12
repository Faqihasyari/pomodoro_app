import 'package:flutter/foundation.dart';
import 'package:pomodoro_app/core/models/task.dart';
import 'package:uuid/uuid.dart'; 

class TaskProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];

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