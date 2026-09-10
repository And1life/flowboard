import 'package:flowboard/domain/entities/task.dart';

class Project {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  List<Task> tasks;

  Project({
    required this.id,
    required this.name,
    required this.description,
    DateTime? createdAt,
    List<Task>? tasks,
  }) : createdAt = createdAt ?? DateTime.now(),
       this.tasks = tasks ?? [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(int id) {
    tasks.removeWhere((item) => item.id == id);
  }

  List<Task> get completedTasks {
    return tasks.where((item) => item.status == TaskStatus.done).toList();
  }
}