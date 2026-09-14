import 'package:flowboard/application/services/task_service.dart';
import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/domain/exceptions/flowboard_exception.dart';
import 'package:flowboard/infrastructure/repositories/task_repository.dart';

void main() {
  final repository = TaskRepository();
  final service = TaskService(repository);

  final task1 = Task(
    id: 1,
    title: 'Learn Dart',
    description: 'Study repositories',
  );

  final task2 = Task(
    id: 2,
    title: 'Build Flowboard',
    description: 'Implement task repository',
    priority: TaskPriority.high,
  );

  final invalidTask = Task(
    id: 3,
    title: '',
    description: 'Invalid task',
  );

  service.createTask(task1);
  service.createTask(task2);

  try {
    service.createTask(invalidTask);
  } on FlowboardException catch (e) {
    print('Error: $e');
  }
  

  print('All tasks:');
  for (final task in service.getTasks()) {
    print(task);
  }

  print('\nFind task with id 1:');
  final task = service.getTask(1);
  print(task);

  print('\nFind task with id 999:');
  final missingTask = service.getTask(999);
  print(missingTask);

  repository.delete(1);

  print('\nTasks after deleting task 1:');
  for (final task in service.getTasks()) {
    print(task);
  }
}
