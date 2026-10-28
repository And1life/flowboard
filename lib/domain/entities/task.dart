import 'package:flowboard/domain/exceptions/flowboard_exception.dart';

enum TaskStatus { todo, inProgress, done }

enum TaskPriority { low, medium, high }

class Task {
  final int id;
  final String title;
  final String description;
  TaskStatus _status;
  final TaskPriority priority;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    TaskStatus status = TaskStatus.todo,
    this.priority = TaskPriority.medium,
    DateTime? createdAt,
  }) : _status = status,
       createdAt = createdAt ?? DateTime.now();

  TaskStatus get status => _status;

  void complete() {
    if (_status != TaskStatus.inProgress) {
      throw FlowboardException('Only in-progress tasks can be completed');
    }

    _status = TaskStatus.done;
  }

  void start() {
    if (_status != TaskStatus.todo) {
      throw FlowboardException('Only todo tasks can be started');
    }
    _status = TaskStatus.inProgress;
  }

  @override
  String toString() {
    return "#$id $title [$_status] $priority";
  }
}
