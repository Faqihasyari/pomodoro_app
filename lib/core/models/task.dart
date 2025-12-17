import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String task;

  @HiveField(2)
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.task,
    this.isCompleted = false,
  });

  TaskModel copyWith({String? id, String? task, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}