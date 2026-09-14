import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/infrastructure/repositories/repository.dart';

class TaskRepository implements Repository<Task> {
  final List<Task> _tasks = [];

  @override
  void create(Task item) {
    _tasks.add(item);
  }

  @override
  Task? findById(int id) {
    for (final task in _tasks) {
      if (task.id == id) {
        return task;
      }
    }

    return null;
  }

  @override
  List<Task> findAll() {
    return _tasks;
  }

  @override
  void delete(int id) {
    _tasks.removeWhere((item) => item.id == id);
  }
}
