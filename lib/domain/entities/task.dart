enum TaskStatus {
  todo,
  inProgress,
  done,
}

enum TaskPriority {
  low,
  medium,
  high,
}

class Task {
  final int id;
  final String title;
  final String description;
  TaskStatus status;
  final TaskPriority priority;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.status = TaskStatus.todo,
    this.priority = TaskPriority.medium,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  void complete() {
    status = TaskStatus.done;
  }

  void start() {
    status = TaskStatus.inProgress;
  }

  @override
  String toString() {
    return "#$id $title [$status] $priority";
  }
}