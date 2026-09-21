import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/domain/exceptions/flowboard_exception.dart';
import 'package:flowboard/infrastructure/repositories/repository.dart';

class TaskService {
  final Repository<Task> _repository;

  TaskService(this._repository);

  void createTask(Task task) {
    if (task.title.trim().isEmpty) {
      throw FlowboardException('Task title cannot be empty');
    }
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
