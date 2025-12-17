import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodoro_app/core/models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];
  final Box<TaskModel> _taskBox;

 
  TaskProvider({required Box<TaskModel> taskBox}) : _taskBox = taskBox {
    _loadTasks();
  }

  void _loadTasks() {
    _tasks.clear(); 
    _tasks.addAll(_taskBox.values); 
    notifyListeners();
  }


  List<TaskModel> get tasks => _tasks;

  void addTask(String task) async {
    if (task.trim().isEmpty) return; 

    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
      task: task.trim(),
    );

    await _taskBox.add(newTask);
    _loadTasks();
  }

  Future<void> toggleTask(String taskId) async {
    final taskIndex = _tasks.firstWhere((task) => task.id == taskId);
    taskIndex.isCompleted = !taskIndex.isCompleted;
    await taskIndex.save();
    _loadTasks();
  }

  Future<void> deleteTask(String taskId) async {
    final task = _tasks.firstWhere((task) => task.id == taskId);
    await task.delete();
    notifyListeners();
  }
  
}