import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/infrastructure/repositories/task_repository.dart';

class TaskService {
  final TaskRepository _repository;

  TaskService(this._repository);

  void createTask(Task task) {
    _repository.create(task);
  }

  Task? getTask(int id) {
    return _repository.findById(id);
  }

  List<Task> getTasks() {
    return _repository.findAll();
  }

  void deleteTask(int id) {
    _repository.delete(id);
  }
}
