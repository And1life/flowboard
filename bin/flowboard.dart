import 'package:flowboard/domain/entities/project.dart';
import 'package:flowboard/domain/entities/task.dart';

void main() {
  final task1 = Task(
    id: 1,
    title: 'Learn Dart',
    description: 'Study Dart OOP',
  );

  final task2 = Task(
    id: 2,
    title: 'Build Flowboard',
    description: 'Create first pet project',
    priority: TaskPriority.high,
  );

  final project = Project(
    id: 1,
    name: 'Flowboard',
    description: 'Dart learning project',
  );

  project.addTask(task1);
  project.addTask(task2);

  print('Tasks: ${project.tasks.length}');

  task1.complete();

  print('\nCompleted tasks:');

  for (final task in project.completedTasks) {
    print(task);
  }

  project.removeTask(2);

  print('\nTasks after removal: ${project.tasks.length}');
}