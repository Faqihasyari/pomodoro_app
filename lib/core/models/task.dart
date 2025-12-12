class TaskModel {
  final String id;
  final String task;
  bool isCompleted;

  TaskModel({required this.id, required this.task, this.isCompleted = false});

  TaskModel copyWith({String? id, String? task, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
