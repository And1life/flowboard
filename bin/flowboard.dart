import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/infrastructure/repositories/task_repository.dart';

void main() {
  final repository = TaskRepository();

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

  repository.create(task1);
  repository.create(task2);

  print('All tasks:');
  for (final task in repository.findAll()) {
    print(task);
  }

  print('\nFind task with id 1:');
  final task = repository.findById(1);
  print(task);

  print('\nFind task with id 999:');
  final missingTask = repository.findById(999);
  print(missingTask);

  repository.delete(1);

  print('\nTasks after deleting task 1:');
  for (final task in repository.findAll()) {
    print(task);
  }
}
